defmodule DagBlockchain.Link do
  @moduledoc """
  Transaction module provides functions to generate transaction
  """
  #FIXME source and target must be only the Transaction struct
  defstruct [:source, :target]
end

defmodule DagBlockchain.Node do
  defstruct [:name]
end

defmodule DagBlockchain.Tip do
  defstruct [:first, :second]
end
