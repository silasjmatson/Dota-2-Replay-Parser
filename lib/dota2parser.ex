defmodule Dota2parser do



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

  defp parse(<<_ignore :: size(24), "\n\bPBDEMS", _ :: size(64), messages :: binary>>) do
    parse_message(messages, [])
  end

  defp parse_message(<< command :: size(32),
                        type :: size(32),
                        message_length :: size(32),
                        message :: size(message_length)-unit(8),
                        messages :: binary>>,
                        parsed_messages) do
    # message = %Message{ # parse stuff into it here }
    # parsed_messages = [message | parsed_messages]
    # parse_message(messages, parsed_messages)
  end

  # defp parse_message(_binary, parsed_messages) do
  #   parsed_messages
  # end
end
