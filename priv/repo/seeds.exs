alias Stats.Records.User
alias Stats.Repo

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