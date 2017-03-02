# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

coseram = Program.create({
  name: "COSERAM",
  main_office: "Butuan",
  area_of_work: "Resource-based conflicts, overlapping planning and titling regimes, governance of natural resources, IP, CADT ADSDPP",
  organisation: "GIZ",
})

Project.create({
  name: "Peace building and development needs (PBDN)",
  main_office: "Butuan",
  area_of_work: "resource-based conflicts",
  organisation: "GIZ",
  program: coseram
})

User.create({email: "test@test.com", password: 12345678})
# forum = Program.create({
#   name: "Dialogue for Peace",
#   main_office: ,
#   area_of_work: ,
#   organisation: "forumZFD"
# })

# cps = Program.create({
#   name: ,
#   main_office: ,
#   area_of_work: ,
#   organisation: "Civil Peace Service"
# })

# kas = Program.create({
#   name: ,
#   main_office: ,
#   area_of_work: ,
#   organisation: "Konrad-Adenauer-Stiftung"
# })
