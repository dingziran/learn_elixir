defmodule Events.GithubEvents do
  @user_agent [{"User-agent","Elixir dingziran@163.com"}]

  def fetch(user, project) do
    events_url(user, project)
    |> HTTPoison.get(@user_agent)
    |> handle_response
  end

  def events_url(user, project) do
    "https://api.github.com/repos/#{user}/#{project}/events"
  end

  def handle_response(%{status_code: 200, body: body}), do: {:ok, body}
  def handle_response(%{status_code: _, body: body}), do: {:error, body}
end
