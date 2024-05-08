defmodule Inix.State do
  @doc """
  A struct/GenServer responsible for representing and managing the state of the system.
  """

  defstruct [:condition, :network, :storage, :services, :startup, :shutdown]

  use GenServer

  @impl true
  def init(_opts) do
  end

  @impl true
  def handle_call(:get, _from, state) do
  end

  def handle_call(transition, _from, _state) when is_atom(transition) do
  end

  @impl true
  def handle_cast(_request, _state) do
  end

  @doc """
  Bring the system up to a target state.
  """
  def up(from, to, event, data) do
  end

  @doc """
  Bring the system down.
  """
  def down(from, to, event, data) do
  end

  @doc """
  Emergency shutdown.
  """
  def failure(from, to, event, data) do
  end

  @doc """
  Notify on all condition changes.
  """
  def log_event(from, to, event, data) do
  end
end
