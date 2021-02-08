defmodule KinesisConsumer.Consumer do
  alias Broadway.Message
  require Logger

  def handle_message(_processor_name, message, _context) do
    message
    |> Message.update_data(&process_data/1)
  end

  defp process_data(raw_data) do
    with {:ok, decoded_data} <- Base.decode64(raw_data),
         {:ok, _decoded_json} <- Jason.decode(decoded_data) do
      IO.puts(decoded_data)
    else
      error -> Logger.error(error |> inspect())
    end
  end

  def handle_failed(messages, _context) do
    messages
    |> inspect()
    |> Logger.error()
  end
end
