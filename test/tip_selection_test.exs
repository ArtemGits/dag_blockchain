defmodule DagBlockchain.TipsSelectionTest do
  use ExUnit.Case

  #TODO refactor this
  alias DagBlockchain.Node, as: Node
  alias DagBlockchain.Link, as: Link
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
    nodes = create_list_of_nodes([], 10)
    assert length(nodes) == 10

    #TODO tips selection algorithm
    tips = [%Node{name: 11}, %Node{name: 12}]
    #TODO function to iterate over nodes for
    create_list_of_links(links, tips, node)

  end

  defp create_list_of_nodes(list,0) do
    list
  end

  defp create_list_of_nodes(list,n) when n > 0 do
    [%Node{name: n} | list]
    |>create_list_of_nodes(n - 1)
  end

  defp create_list_of_links(list, tips, node) do
    {first_tip, second_tip} = tips
    case {lenght(tips) > 0, length(tips) > 1 and first_tip.name != second_tip.name} do
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

