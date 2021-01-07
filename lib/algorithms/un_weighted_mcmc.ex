defmodule DagBlockchain.Algorithms do
  @moduledoc """
  This module provides functions for consensus process
  """

  @doc """
  Launch consensus algorithm. Start from genesis. Return two tips for consensus
  """
  #FIXME move to consensus module
  def unweighted_mcmc(nodes, links) do
    #TODO elixir way to check if nodes lenght is 0, return then []
    [start | _tail_nodes] = nodes 
    [
      random_walk(links, start),
      random_walk(links, start)
    ]
  end

  def random_walk(links, start) do
    particle = start
    walk(links, particle, is_tip?(links, particle))
  end

  #FIXME more functional way
  defp walk(links, particle, true) do
    [head_link, tail_links] =  links
    particle = head_link.target
    walk(tail_links, particle, is_tip?(tail_links, head_link.target))
  end

  defp walk(links, particle, false) do
    particle
  end

  @doc """
  Function to check if node of DAG is a tip. Return boolean.
  """
  def is_tip?(links, node) do
    Enum.any?(links, fn link -> node == link.target end)
  end

  def get_approvers(links, node) do

  end

  def choose(array) do

  end

end
