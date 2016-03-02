defmodule Dota2parserTest do
  use ExUnit.Case
  doctest Dota2parser

  test ".parse" do
    Dota2parser.process("replays/2169368896.dem")
  end
end
