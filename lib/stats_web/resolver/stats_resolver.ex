defmodule StatsWeb.StatsResolver do
    alias Stats.Records
    
    def stats_total(
        _root,
        %{
          initial_timestamp: initial_timestamp,
          final_timestamp: final_timestamp
        },
        _info
    ) do
      visits = Records.stats_total(initial_timestamp, final_timestamp)
      {:ok, visits}
    end
end