defmodule Inix.State do
  @doc """
  A struct/GenServer responsible for representing and managing the state of the system.
  """

  alias Inix.Daemon.Call, as: DaemonCall
  alias Inix.Job.Call, as: JobCall
  alias Inix.Tenant.Call, as: TenantCall

  defstruct [
    condition: nil,
    daemons: [],
    jobs: [],
    tenants: []
  ]

  @conditions %Maxine.Machine{
    initial: :boot,
    transitions: %{
      start: %{ boot: :pending },
      ok: %{ pending: :ok },
      degrade: %{ degradeable: :degraded },
      recover: %{ degraded: :ok },
      fail: %{ *: :failed },
      shutdown: %{ operational: :shutdown },
      halt: %{ shutdown: :halted }
    },
    groups: %{
      pending: [:operational],
      ok: [:operational, :degradeable],
      degraded: [:operational, :degradeable],
      halted: [:terminal],
      failed: [:terminal]
    }
    callbacks: %{
      entering: %{
        pending: :system_up,
        shutdown: :system_down,
        fail: :system_failure
      },
      events: %{
        *: :log_event
      },
      module: __MODULE__
    }
  }

  def conditions(), do: @conditions

  use GenServer

  @impl true
  def init(_opts) do
    condition = 
    {:ok, %__MODULE__{condition: Maxine.generate(@conditions)}}
  end

  @impl true
  def handle_call(%DaemonCall{}, _from, _state) do
  end

  def handle_call(%JobCall{}, _from, _state) do
  end

  def handle_call(%TenantCall{}, _from, _state) do
  end

  def handle_call(:get, _from, state) do
  end

  def handle_call(transition, _from, _state) when is_atom(transition) do
    new_state = %{ state | condition: advance!(state.condition, transition) }
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
