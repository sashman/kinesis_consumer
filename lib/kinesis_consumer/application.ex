defmodule KinesisConsumer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    stream_name = System.get_env("STREAM_NAME") |> check_stream_name()
    app_name = System.get_env("APP_NAME", "kinesis_consumer_app")

    opts = [
      stream_name: stream_name,
      app_name: app_name,
      shard_consumer: KinesisConsumer.Consumer,
      processors: [
        default: [
          concurrency: 1,
          min_demand: 1,
          max_demand: 5
        ]
      ],
      batchers: []
    ]

    children = [
      {KinesisClient.Stream, opts}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: KinesisConsumer.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp check_stream_name(nil), do: raise("STREAM_NAME env var not set")
  defp check_stream_name(stream_name), do: stream_name
end
