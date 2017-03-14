# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

coseram = Program.create({
  name: "COSERAM",
  main_office: "J.P. Rosales St., Butuan City",
  area_of_work: "Resource-based conflicts, overlapping planning and titling regimes, governance of natural resources, IP, CADT ADSDPP",
  organisation: "GIZ",
})

Project.create({
  name: "Peace building and development needs (PBDN)",
  main_office: "J.P. Rosales St., Butuan City",
  area_of_work: "resource-based conflicts",
  program: coseram
})

Project.create({
  name: "Land use planning and resource management",
  main_office: "J.P. Rosales St., Butuan City",
  area_of_work: "overlapping planning and titling regimes",
  program: coseram
})

Project.create({
  name: "Titling and natural resource management in ancestral domains",
  main_office: "J.P. Rosales St., Butuan City",
  area_of_work: "governance of natural resources",
  program: coseram
})

Project.create({
  name: "Access to legal and paralegal services",
  main_office: "J.P. Rosales St., Butuan City",
  area_of_work: "indigenous people, ancestral domain, CADT, ADSDPP",
  program: coseram
})

Project.create({
  name: "Indigenous Practices for Conservation of Biodiversity (IP4BIODIV)",
  main_office: "J.P. Rosales St., Butuan City",
  area_of_work: "Protected Area Management, Biodiversity Conservation, Livelihood, Indigenous Practices, FPIC",
  program: coseram
})


redd = Program.create({
  name: "REDD+",
  main_office: "Davao City",
  area_of_work: "conservation of forest carbon stock that leads to protection, enhancement of forest carbon stock that results to rehabilitation, sustainable management of forests or simply management",
  organisation: "GIZ",
})

forum = Program.create({
  name: "Dialogue for Peace",
  main_office: "Davao City",
  area_of_work: "civil peace service, conflict transformation",
  organisation: "forumZFD",
})

Project.create({
  name: "forumZFD",
  main_office: "Butuan City",
  area_of_work: "involved with both IPs in Surigao, particularly with Mamanwa Tribe and non-IPs; generally focused on validating customary laws and helping IPs to establish their original indigenous structure; also works with local NGOs; establish community practitioners, the aim of which being to replicate non-violent conflict transformation tools.",
  program: forum
})
Project.create({
  name: "forumZFD",
  main_office: "Cotabato City",
  area_of_work: "working with the media; engaging key actors with different sectors, stakeholders and grassroots communities in dialogue.",
  program: forum
})
Project.create({
  name: "forumZFD",
  main_office: "Davao City",
  area_of_work: "engaging Higher Education Institutions (HEIs) through the Commission on Higher Education (CHED) for the integration of peace topics in teacher’s education, integration of conflict sensitive journalism; integration of peace topics in political science subjects",
  program: forum
})

cps = Program.create({
  name: "Civil Peace Service GIZ",
  main_office: "PDCP Bank Centre, Rufino cor. Leviste Sts., Salcedo Village, Makati City",
  area_of_work: "conflict transformation, peacebuilding, Lobby and advocacy, especially concerning the rights of IPs, Rido Conflict Transformation, broadening Constituencies for the Bangsamoro peace process, strengthening Barangay Peace and Order infrastructure, grassroots leaders’ engagement in monitoring/de-escalating armed conflict, Integration of marginalized voices and groups in the Bangsamoro peace process, supporting adequate dialogue mechanisms to exchange and discuss controversial topics concerning BBL and for the provision of un-biased information on the peace process",
  organisation: "GIZ"
})

kas = Program.create({
  name: "Democratic Party Development (DEPADEV) Bangsamoro",
  main_office: "Cotabato City",
  area_of_work: "Political party building and development; empowerment of CSOs and underrepresented groups for active political participation; protection of human rights; rule of law and gender",
  organisation: "Konrad-Adenauer-Stiftung"
})

User.create({
  email: "test@test.com",
  password: 12345678,
  fullname: "Test User",
  program: coseram,
  expertise: "indigenous people rights, land titling",
  address: "Cotabato City"
})
