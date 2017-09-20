defmodule Utilities.Time do

  use Timex

  def zonal_timestamp(zone \\ "US/Eastern") do
    Timex.format!(Timex.now(zone), "%FT%T%:z", :strftime)
  end

end

defmodule Utilities.Log do


  def console(message, module \\ nil) do

    module = case module do
      nil -> " -- "
      _   -> "-- #{to_string(module)} -- "
    end

    IO.puts "[#{Utilities.Time.zonal_timestamp}] #{module} #{message}"
  end

end


# Timex.timezones |> Enum.each(&(IO.puts "#{&1}"))
