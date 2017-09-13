defmodule Calculator.Worker do

    def init(init_value \\ 0) do
      pid =  spawn(fn() -> loop(init_value) end)
      pid
    end

    defp loop(current_value) do
      IO.puts "loop() process waiting for callback with current_value = #{current_value}"
      new_value = receive do

                    {:value, client_id} -> send(client_id, {:response, current_value})
                                           current_value

                    {:add, value}       -> current_value + value
                    {:sub, value}       -> current_value - value
                    {:div, value}       -> current_value / value
                    {:double}           -> current_value * 2
                    {:mul, value}       -> current_value * value

                    invalid_request -> IO.puts("Invalid request #{inspect invalid_request}")

                    current_value
                  end

      #true =  current_value == new_value
      IO.puts "loop() callback transformed #{current_value} to new value #{new_value}"
      loop(new_value)
    end

    def value(pid) do
      IO.puts "value() sending process #{inspect pid} this pid #{inspect self()}"
      send(pid, {:value, self()})
      receive() do
        {:response, value} -> value
      end

    end

    #def add(server_id, value), do: send(server_id, {:add, value})
    def add(server_id, value) do
      IO.puts "add() sending to #{inspect server_id} from #{inspect self()}"
       send(server_id, {:add, value})
       value(server_id)
    end

    def sub(server_id, value) do
      IO.puts "sub() sending to #{inspect server_id} from #{inspect self()}"
       send(server_id, {:sub, value})
       value(server_id)
    end

    def double(server_id) do
      IO.puts "double() sending to #{inspect server_id} from #{inspect self()}"
       send(server_id, {:double})
       value(server_id)
    end

end
