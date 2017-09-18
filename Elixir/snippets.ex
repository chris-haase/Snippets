# epoch timeseconds
:os.system_time(:seconds)
:timer.seconds(15)

# config
Application.get_env(:application_atom, :your_atom)

# Cache
Cachex.set(:my_cache, "key", "value", ttl: :timer.seconds(5))
Cachex.get(:my_cache, "key")

 Node.list :this

  # access to pids 
  pid = Process.whereis(name_of_pid) 
  list = Process.registered

Process.exit(pid, :kill)
