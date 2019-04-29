# --------------------------------------------
# List of Dates from a starting point
# --------------------------------------------

# example uses Timex
# implies Last N days
Enum.take(Stream.iterate(Date.utc_today, &Timex.shift(&1, days: -1)), 7)              

# implies Next N days
Enum.take(Stream.iterate(Date.utc_today, &Timex.shift(&1, days: 1)), 7)              



dates = Enum.take(Stream.iterate(Date.utc_today, &Timex.shift(&1, days: -1)), 7) 
dates |> Enum.each( &function(&1))
