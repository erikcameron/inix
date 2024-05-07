defmodule Inix.Exec.Mode.Daemon do
  @moduledoc """
  Always-on services and their supervisor.
  """

  use Supervisor

  def start_link(_init_arg) do
    {:ok, _pid} = :exec.start()
    Supervisor.start_link(__MODULE__, init_arg, name: __MODULE__)
  end

  @impl true
  def init(_init_arg) do
    Supervisor.init(service_manifest(), strategy: :one_for_one)
  end

  def service_manifest() do
    []
  end
end
