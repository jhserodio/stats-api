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
      stats = Records.stats_total(initial_timestamp, final_timestamp)
      {:ok, stats}
    end

    def stats_by(
        _root,
        args,
        _info
    ) do
      stats = Records.stats_by(args)
      {:ok, stats}
    end
end