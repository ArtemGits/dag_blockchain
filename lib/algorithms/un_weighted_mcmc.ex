defmodule DagBlockchain.Algorithms do
  @moduledoc """
  This module provides functions for consensus process
  """

  @doc """
  Launch consensus algorithm. Start from genesis. Return two tips for consensus
  """
  #FIXME move to consensus module
  def un_weighted_mcmc(nodes, links) do
    #TODO elixir way to check if nodes lenght is 0, return then []
    start = nodes[0]
    [
      random_walk(links, start),
      random_walk(links, start)
    ]
  end

  def random_walk(links, start) do
    
  end

  @doc """
  Function to check if node of DAG is a tip. Return boolean.
  """
  def is_tip?(links, particle) do
    #check if some of the 
  end

  def get_approvers(links, node) do

  end

  def choose(array) do

  end

end
