defmodule StatsWeb.StatsResolver do
    alias Stats.Records
    
    def stats_total(
        _root,
        args,
        _info
    ) do
      checkDates = 
        (
          Map.has_key?(args, :initial_timestamp)
          && Map.has_key?(args, :final_timestamp)
        ) && args.inital_timestamp > args.final_timestamp

      if checkDates do
        {:error, "initial_timestamp is greather than final_timestamp"}
      else
        stats = Records.stats_total(args)
        {:ok, stats}
      end
    end

    def stats_by(
        _root,
        args,
        _info
    ) do
      checkDates = 
        (
          Map.has_key?(args, :initial_timestamp)
          && Map.has_key?(args, :final_timestamp)
        ) && args.inital_timestamp > args.final_timestamp

      if checkDates do
        {:error, "initial_timestamp is greather than final_timestamp"}
      else
        stats = Records.stats_by(args)
        {:ok, stats}
      end
    end
end