defmodule DistilleryTest.Service do
  use GenServer
  require Logger

  def start_link(_) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_) do
    Process.send_after(self(), :do_it, 1000)
    {:ok, :ok}
  end

  def handle_info(:do_it, _) do
    {:ok, _server_pid, _server_os_pid} = Exexec.run_link(~s|echo "hello world"|, stdout: true)
    Process.send_after(self(), :do_it, 1000)
    {:noreply, :ok}
  end


  def handle_info(msg, _) do
    Logger.error inspect msg
    {:noreply, :ok}
  end
end
