import Config

config :logger,
  backends: [:console, {LoggerSyslogBackend, :syslog}]

# config :logger, :syslog,
# buffer: System.get_env("EX_SYSLOG_BUFFER_SIZE", "10000") |> String.to_integer(),
# path: System.get_env("EX_SYSLOG_SOCKET_PATH", "/var/log/")
