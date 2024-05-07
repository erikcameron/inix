defmodule Inix.Exec.Mode.Job do
  @moduledoc """
  A task executed by the system that is specified up front and runs
  transactionally with respect to state, though it may be sync or
  async from a calling perspective. Compare `Inix.Exec.Session` for
  interactive cases.
  """
end
