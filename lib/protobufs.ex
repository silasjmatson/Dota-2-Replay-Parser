defmodule Protobufs do
  use Protobuf, from: Path.wildcard(Path.expand("../proto/*.proto", __DIR__)), use_package_names: true
end
