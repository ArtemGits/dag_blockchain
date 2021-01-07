defmodule DagBlockchain.TipsSelectionTest do
  use ExUnit.Case

  #TODO refactor this
  alias DagBlockchain.Node, as: Node
  alias DagBlockchain.Link, as: Link
  alias DagBlockchain.Algorithms, as: Algo
  #alias DagBlockchain.Tip, as: Tip

 # test "unweightedMCMC algorithm" do
 #   nodes = initNodes(2)
 #   links = []
 #   tips = unWeightedMCMC(nodes, links, start: nodes[0])
 #   assert length(tips) == 2
 #   assert tips[0] == nodes[0]
 #   assert tips[1] == nodes[0]
 # end

  #TODO create test suit!
  test "Dag's transaction generate" do
    nodes = create_list_of_nodes([], 3)
    #assert length(nodes) == 3
    IO.inspect(nodes)

    candidate_links = []
    #candidate_nodes = Enum.chunk(nodes, 3, 3, [])
    #IO.inspect(candidate_nodes)
    candidate_nodes = nodes
    links = Enum.reduce(candidate_nodes, [], &simulation(&1, &2, candidate_links, candidate_nodes))
    IO.inspect(links)
  end

  defp simulation(node, result, candidate_links, candidate_nodes) do
    #TODO tips selection algorithm
    candidate_links = result
    IO.inspect(candidate_links)
    tips = Algo.unweighted_mcmc(candidate_nodes, candidate_links)
    #TODO function to iterate over nodes for
    candidate_links ++ create_list_of_links(candidate_links, tips, node)
  end


  defp create_list_of_nodes(list,0) do
    list
  end

  defp create_list_of_nodes(list,n) when n > 0 do
    [%Node{name: n} | list]
    |>create_list_of_nodes(n - 1)
  end

  defp create_list_of_links(list, tips, node) do
    [first_tip, second_tip] = tips
    case {length(tips) > 0, length(tips) > 1 and first_tip.name != second_tip.name} do
      {true, true} ->
        list
        |> push_link(node, first_tip)
        |> push_link(node, second_tip)
      {true, _} ->
        push_link(list, node, first_tip)
      {false, _} ->
        list
    end
  end

  defp push_link(list, source, target) do
    [%Link{source: source, target: target} | list]
  end





end

