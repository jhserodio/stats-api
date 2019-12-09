defmodule Visits do
    alias Stats.Records.Visit
    alias Stats.Repo

    def seed() do
        %Visit{
            user_id: 1,
            website_id: 1,
            timestamp: DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
        }  |> Repo.insert!
    end

    def seed() do
        %Visit{
            user_id: 1,
            website_id: 2,
            timestamp: DateTime.from_naive!(~N[2011-04-17T14:00:00Z], "Etc/UTC")
        }  |> Repo.insert!
    end

    def seed() do
        %Visit{
            user_id: 1,
            website_id: 3,
            timestamp: DateTime.from_naive!(~N[2012-04-17T14:00:00Z], "Etc/UTC")
        }  |> Repo.insert!
    end

    def seed() do
        %Visit{
            user_id: 1,
            website_id: 4,
            timestamp: DateTime.from_naive!(~N[2013-04-17T14:00:00Z], "Etc/UTC")
        }  |> Repo.insert!
    end

    def seed() do
        %Visit{
            user_id: 1,
            website_id: 5,
            timestamp: DateTime.from_naive!(~N[2014-04-17T14:00:00Z], "Etc/UTC")
        }  |> Repo.insert!
    end

    def seed() do
        %Visit{
            user_id: 2,
            website_id: 6,
            timestamp: DateTime.from_naive!(~N[2019-04-17T14:00:00Z], "Etc/UTC")
        }  |> Repo.insert!
    end

    def seed() do
        %Visit{
            user_id: 2,
            website_id: 2,
            timestamp: DateTime.from_naive!(~N[2019-04-17T11:00:00Z], "Etc/UTC")
        }  |> Repo.insert!
    end

    def seed() do
        %Visit{
            user_id: 2,
            website_id: 3,
            timestamp: DateTime.from_naive!(~N[2019-04-17T09:00:00Z], "Etc/UTC")
        }  |> Repo.insert!
    end

    def seed() do
        %Visit{
            user_id: 2,
            website_id: 8,
            timestamp: DateTime.from_naive!(~N[2019-04-17T08:00:00Z], "Etc/UTC")
        }  |> Repo.insert!
    end

    def seed() do
        %Visit{
            user_id: 2,
            website_id: 5,
            timestamp: DateTime.from_naive!(~N[2019-04-17T07:00:00Z], "Etc/UTC")
        }  |> Repo.insert!
    end

    def seed() do
        %Visit{
            user_id: 4,
            website_id: 1,
            timestamp: DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
        }  |> Repo.insert!
    end

    def seed() do
        %Visit{
            user_id: 4,
            website_id: 2,
            timestamp: DateTime.from_naive!(~N[2011-04-17T14:00:00Z], "Etc/UTC")
        }  |> Repo.insert!
    end

    def seed() do
        %Visit{
            user_id: 4,
            website_id: 3,
            timestamp: DateTime.from_naive!(~N[2012-04-17T14:00:00Z], "Etc/UTC")
        }  |> Repo.insert!
    end

    def seed() do
        %Visit{
            user_id: 4,
            website_id: 4,
            timestamp: DateTime.from_naive!(~N[2013-04-17T14:00:00Z], "Etc/UTC")
        }  |> Repo.insert!
    end

    def seed() do
        %Visit{
            user_id: 4,
            website_id: 5,
            timestamp: DateTime.from_naive!(~N[2014-04-17T14:00:00Z], "Etc/UTC")
        }  |> Repo.insert!
    end

    def seed() do
        %Visit{
            user_id: 8,
            website_id: 6,
            timestamp: DateTime.from_naive!(~N[2019-04-17T14:00:00Z], "Etc/UTC")
        }  |> Repo.insert!
    end

    def seed() do
        %Visit{
            user_id: 8,
            website_id: 2,
            timestamp: DateTime.from_naive!(~N[2019-04-17T11:00:00Z], "Etc/UTC")
        }  |> Repo.insert!
    end

    def seed() do
        %Visit{
            user_id: 8,
            website_id: 3,
            timestamp: DateTime.from_naive!(~N[2019-04-17T09:00:00Z], "Etc/UTC")
        }  |> Repo.insert!
    end

    def seed() do
        %Visit{
            user_id: 8,
            website_id: 8,
            timestamp: DateTime.from_naive!(~N[2019-04-17T08:00:00Z], "Etc/UTC")
        }  |> Repo.insert!
    end

    def seed() do
        %Visit{
            user_id: 8,
            website_id: 5,
            timestamp: DateTime.from_naive!(~N[2019-04-17T07:00:00Z], "Etc/UTC")
        }  |> Repo.insert!
    end
end