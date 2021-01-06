defmodule DagBlockchain.DagBlockchainTest do
  use ExUnit.Case

  import ShorterMaps
  alias DagBlockchain.{
    Account,
    Block,
    Blockchain,
    Transaction,
    Transaction.TxOut,
    Dag
  }

  @amount 10000

  setup do
    account = Account.new
    blockchain = Blockchain.new()
      |> Blockchain.coinbase(account)
      |> Blockchain.difficulty(1)
      |> Blockchain.create_genesis_block

    {:ok, blockchain: blockchain}
  end

  @tag timeout: :infinity
  @tag :skip
  test "Adding a large number of blocks", ~M{blockchain} do
    blockchain =
      blockchain
      |> Blockchain.difficulty(3)

    {uSec, blockchain} = :timer.tc(fn -> adding_block(@amount, blockchain) end)
    IO.inspect("Blockchain: #{uSec / 1_000_000}")
    #assert length(blockchain.chain) == 10_000
  end

  @tag timeout: :infinity
  @tag :skip
  test "Build dag" do
      {uSec, {:ok, dag}} = :timer.tc(fn ->
        build_dag(1, Dag.new() |> ok(&Dag.add_vertex(&1, "Block-1"))) end)
    IO.inspect("DAG: #{uSec / 1_000_000}")
    #assert length(vertices(dag)) == 10_000
  end

  defp build_dag(@amount, dag) do
    dag
  end

  defp build_dag(n, dag) do
    n = n + 1
    {:ok, res} = dag
    {:ok, vres} = Dag.add_vertex(res, "Block-#{n}")
    {:ok, vedge} = Dag.add_edge(vres, "Block-#{n-1}", "Block-#{n}")
    build_dag(n, {:ok, vedge})
  end

  defp adding_block(1, blockchain) do
    blockchain
  end

  defp ok({:ok, result}), do: result
  defp ok({:ok, result}, cb), do: cb.(result)

  defp adding_block(n, blockchain) do
    n = n - 1
    blockchain =
      blockchain
      |> Blockchain.add_block(Block.new("Block-#{n}"))
    adding_block(n, blockchain)
  end
end
