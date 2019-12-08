defmodule Websites do
    alias Stats.Records.Website
    alias Stats.Repo

    def seed() do
        %Website{
            url: "https://www.ecma-international.org/publications/standards/Ecma-262.htm",
            topic: "frontend"
        }  |> Repo.insert!
        
        %Website{
            url: "https://postcss.org/",
            topic: "frontend"
        }  |> Repo.insert!

        %Website{
            url: "https://github.com/css-modules/css-modules",
            topic: "frontend"
        }  |> Repo.insert!

        %Website{
            url: "https://elm-lang.org/",
            topic: "frontend"
        }  |> Repo.insert!

        %Website{
            url: "https://webassembly.org",
            topic: "frontend"
        }  |> Repo.insert!

        %Website{
            url: "https://www.rust-lang.org/",
            topic: "backend"
        }  |> Repo.insert!
        
        %Website{
            url: "https://nodejs.org",
            topic: "backend"
        }  |> Repo.insert!

        %Website{
            url: "https://www.python.org/",
            topic: "backend"
        }  |> Repo.insert!

        %Website{
            url: "https://www.haskell.org/",
            topic: "backend"
        }  |> Repo.insert!

        %Website{
            url: "https://www.java.com/",
            topic: "backend"
        }  |> Repo.insert!

        %Website{
            url: "https://www.linux.org/",
            topic: "os"
        }  |> Repo.insert!

        %Website{
            url: "https://www.arch.com/",
            topic: "os"
        }  |> Repo.insert!
    end
end