defmodule Users do
    alias Stats.Records.User
    alias Stats.Repo

    def seed() do
        %User{
            name: "Joao Henrique Serodio",
            email: "joao.serodio@vnator.com",
            date_of_birth: ~D[1989-09-20],
            gender: "MALE"
        }  |> Repo.insert!
        
        %User{
            name: "Ana Caroline Silva Vieira",
            email: "ana.vieira@vnator.com",
            date_of_birth: ~D[1996-06-07],
            gender: "FEMALE"
        }  |> Repo.insert!
        
        %User{
            name: "Murilo Borges Andrade",
            email: "murilo.andrade@vnator.com",
            date_of_birth: ~D[1992-04-08],
            gender: "UNIDENTIFIED"
        }  |> Repo.insert!
        
        
        %User{
            name: "Joao da Silva Sauro",
            email: "carambols@vnator.com",
            date_of_birth: ~D[1959-09-20],
            gender: "MALE"
        }  |> Repo.insert!
        
        %User{
            name: "Batatinha Quando Nasce",
            email: "batatinha@vnator.com",
            date_of_birth: ~D[1567-12-07],
            gender: "FEMALE"
        }  |> Repo.insert!
        
        %User{
            name: "Yusuke Urameshi",
            email: "yuyu@vnator.com",
            date_of_birth: ~D[1989-04-08],
            gender: "MALE"
        }  |> Repo.insert!
        
        
        %User{
            name: "Pedro Pedrada",
            email: "pedro@vnator.com",
            date_of_birth: ~D[1957-11-15],
            gender: "UNIDENTIFIED"
        }  |> Repo.insert!
        
        %User{
            name: "Jose Mane",
            email: "jose@vnator.com",
            date_of_birth: ~D[1989-05-01],
            gender: "FEMALE"
        }  |> Repo.insert!
        
        %User{
            name: "Gon Freaks",
            email: "gon@vnator.com",
            date_of_birth: ~D[1912-04-08],
            gender: "MALE"
        }  |> Repo.insert!
        
        
        %User{
            name: "Hawkeye",
            email: "hawkeye@vnator.com",
            date_of_birth: ~D[1912-12-12],
            gender: "FEMALE"
        }  |> Repo.insert!
        
        %User{
            name: "Fulano de Tal",
            email: "fulano@vnator.com",
            date_of_birth: ~D[1456-04-17],
            gender: "FEMALE"
        }  |> Repo.insert!
        
        %User{
            name: "Cyclone de Tal",
            email: "ciclano@vnator.com",
            date_of_birth: ~D[1972-04-08],
            gender: "UNIDENTIFIED"
        }  |> Repo.insert!
    end
end