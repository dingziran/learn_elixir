defmodule Github_events.CLI do
	@default_count 4
	@moduledoc """
	Handle the command line parsing and the dispatch to the various functions that end up generating a table of the last _n_ events in a github project
	"""

	def run(argv) do
	  argv
	    |> parse_args
	    |> process
	end

	def process(:help) do
	  IO.puts """
	  usage: github_events <user> <project> [ count | #{@default_count} ]
	  """
	  System.halt(0)
	end	

	def process({user, project, _count}) do
	  Github_events.Events.fetch(user, project)
	end

	@doc """
	`argv` can be -h or --help, which returns :help.
	Otherwise it is a github user name, project name, and (optionally) the number of entries to formal.
	Return a tuple of `{ user, project, count }`, or `:help` if help was given.
	"""
	def parse_args(argv) do
		parse = OptionParser.parse(argv, switches: [help: :boolean],
						aliases: [h: :help])
		case parse do
		{[help: true], _, _} -> :help
		{_, [user, project, count], _ } -> {user, project, String.to_integer(count)}
		{_, [user, project ], _ } -> {user, project, @default_count}
		_ -> :help
		end
	end
end
