defmodule DistilleryTest.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Must uncomment this to work with distillery...
      #%{id: Exexec, start: {Exexec, :start, []}},
      DistilleryTest.Service
    ]

    opts = [strategy: :one_for_one, name: DistilleryTest.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
