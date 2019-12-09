Code.require_file("seeds/users.exs", __DIR__)
Code.require_file("seeds/websites.exs", __DIR__)
Code.require_file("seeds/visits.exs", __DIR__)

Users.seed()
Websites.seed()
Visits.seed()