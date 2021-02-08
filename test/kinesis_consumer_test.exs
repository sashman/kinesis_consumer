defmodule KinesisConsumerTest do
  use ExUnit.Case
  doctest KinesisConsumer

  test "greets the world" do
    assert KinesisConsumer.hello() == :world
  end
end
