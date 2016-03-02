defmodule Dota2parser do
  import Protobufs


  @doc """

  """
  def main(argv) do
    {[file: path], _, _} = OptionParser.parse(argv)
    process(path)
  end

  def process(path) do
    contents = File.read!(path)
    parse(contents)
  end

  defp parse(<<_ignore :: size(192), "\n\bPBDEMS", _ :: size(64), messages :: binary>>) do
    parse_message(messages, [])
  end

  defp parse_message(<< command :: size(8),
                        tick :: size(8),
                        message_length :: size(8),
                        message :: size(message_length)-unit(8),
                        messages :: binary>>,
                        parsed_messages) do
    # extract message type and compressed flag
    # from command (see https://github.com/dotabuff/manta/blob/master/parser.go#L193)

    parsed_messages = [message | parsed_messages]
    parse_message(messages, parsed_messages)
  end

  defp parse_message(_binary, parsed_messages) do
    # _binary is <<5>>, are all replay files terminated like this?
    parsed_messages
  end
end
