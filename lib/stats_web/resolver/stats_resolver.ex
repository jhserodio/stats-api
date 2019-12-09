defmodule StatsWeb.StatsResolver do
    alias Stats.Records
    
    def stats_total(
        _root,
        args,
        _info
    ) do
      stats = Records.stats_total(args)
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