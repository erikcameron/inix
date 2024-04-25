defmodule Inix.System.Startup do
  @steps [
    :local_filesystems,
    :local_net,
    :remote_net,
    :remote_filesystems,
    :api,
    :services
  ]
end
