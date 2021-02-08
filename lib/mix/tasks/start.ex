defmodule Mix.Tasks.Start do
  def run(_args) do
    Mix.Task.run("app.start")

    keep_running()
  end

  defp keep_running(), do: keep_running()
end
