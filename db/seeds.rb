# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


########## causing errors on db:seed #########################
# For Omniauth
# AuthenticationProvider.create(name: 'facebook')
# AuthenticationProvider.create(name: 'twitter')
# AuthenticationProvider.create(name: 'gplus')
# AuthenticationProvider.create(name: 'google')
# AuthenticationProvider.create(name: 'linked')


# ####################################################
# 1.0 User Tables and related role/access
# ####################################################

# 1.1 User Section and Role
User.create!([
    # Scenario Testing Users
    {username: "admin", first_name: "Admin", last_name: "Im", email: "admin@gobantu.com", password: "qwerasdf", role: 0},
    {username: "manager", first_name: "Manager", last_name: "Im", email: "company@gobantu.com", password: "qwerasdf", role: 0},
    {username: "volunteer", first_name: "Volunteer", last_name: "Im", email: "user1@gobantu.com", password: "qwerasdf", role: 1},
    {username: "organizer", first_name: "Organizer", last_name: "Im", email: "user2@gobantu.com", password: "qwerasdf", role: 1},
    {username: "donor", first_name: "Donor", last_name: "Im", email: "user3@gobantu.com", password: "qwerasdf", role: 1},
    {username: "vol_org", first_name: "Volunteer", last_name: "Orgnizer", email: "user4@gobantu.com", password: "qwerasdf", role: 1},
    {username: "vol_donor", first_name: "Volunteer", last_name: "Donor", email: "user5@gobantu.com", password: "qwerasdf", role: 1},
    {username: "org_donor", first_name: "Organizer", last_name: "Donor", email: "user6@gobantu.com", password: "qwerasdf", role: 1},
    {username: "anyuser", first_name: "Any", last_name: "User", email: "user7@gobantu.com", password: "qwerasdf", role: 1},
    # ID: 10 - 22 are actual volunteers
    {username: "leonell", first_name: "Leonell", last_name: "Subramaniam", email: "volunteer1@gobantu.com", password: "qwerasdf", phone_number: "6012-6247XXX", birthday: "1998-01-01", role: 1},
    {username: "pangjm", first_name: "Pang", last_name: "Jie Min", email: "volunteer2@gobantu.com", password: "qwerasdf", phone_number: "6017-7232XXX", birthday: "1998-01-01", role: 1},
    {username: "nessalee", first_name: "Nessa Lee", last_name: "Ni Xuan", email: "volunteer3@gobantu.com", password: "qwerasdf", phone_number: "6011-1092XXX", birthday: "1997-01-01", role: 1},
    {username: "nurkayfah", first_name: "Nurkayfah Raina", last_name: "Khairul Anuar", email: "volunteer4@gobantu.com", password: "qwerasdf", phone_number: "6017-6705XXX", birthday: "1999-01-01", role: 1},
    {username: "erlina", first_name: "Erlina", last_name: "Saiful Anwar", email: "volunteer5@gobantu.com", password: "qwerasdf",phone_number: "6012-1234XXX", birthday: "1990-01-01", role: 1},
    {username: "teohjs", first_name: "Teoh", last_name: "Jun Seong", email: "volunteer6@gobantu.com", password: "qwerasdf", phone_number: "6012-3337XXX", birthday: "1986-01-01", role: 1},
    {username: "chongsy", first_name: "Chong", last_name: "Shin Yit", email: "volunteer7@gobantu.com", password: "qwerasdf", phone_number: "6012-2089XXX", birthday: "1999-01-01", role: 1},
    {username: "aishah", first_name: "Aishah Rohaiza", last_name: "HJ Abu Bakar", email: "volunteer8@gobantu.com", password: "qwerasdf", phone_number: "6012-2059XXX", birthday: "1986-01-01", role: 1},
    {username: "dayvenn", first_name: "Dayvenn Khaw", last_name: "Ming Li", email: "volunteer9@gobantu.com", password: "qwerasdf", phone_number: "6012-5353XXX", birthday: "1986-01-01", role: 1},
    {username: "bernadette", first_name: "Bernadette", last_name: "Jamai", email: "volunteer10@gobantu.com", password: "qwerasdf", phone_number: "6011-2603XXX", birthday: "1998-01-01", role: 1},
    {username: "arinah", first_name: "Arinah", last_name: "Zainordin", email: "volunteer11@gobantu.com", password: "qwerasdf", phone_number: "6019-6587XXX", birthday: "1988-01-01", role: 1},
    {username: "maple", first_name: "Maple", last_name: "Lim", email: "volunteer12@gobantu.com", password: "qwerasdf", phone_number: "6012-9875XXX", birthday: "1995-01-01", role: 1},
    {username: "gabrielle", first_name: "Gabrielle", last_name: "Lim", email: "volunteer13@gobantu.com", password: "qwerasdf", phone_number: "6016-2637XXX", birthday: "1998-01-01", role: 1},
    # ID: 23 - 26 are actual organizers
    {username: "sunwaygospel", first_name: "Sunway", last_name: "Gospel", email: "orgnizer1@gobantu.com", password: "qwerasdf", phone_number: "6011-2234XXX", birthday: "1998-01-01", role: 1},
    {username: "kalsom", first_name: "Kalsom", last_name: "Movement", email: "orgnizer2@gobantu.com", password: "qwerasdf", phone_number: "6019-4456XXX", birthday: "1988-01-01", role: 1},
    {username: "calvalry", first_name: "Calvalry", last_name: "Land", email: "orgnizer3@gobantu.com", password: "qwerasdf", phone_number: "6012-7733XXX", birthday: "1995-01-01", role: 1},
    {username: "shelter", first_name: "Shelter", last_name: "Home", email: "orgnizer4@gobantu.com", password: "qwerasdf", phone_number: "6016-3388XXX", birthday: "1998-01-01", role: 1}

  ])


# 1.2 When User hosted a project, he/she become organizer
Organizer.create!([
    {user_id: 4, company_name: "Let's Do It", email: "company1@gmail.com", address_1: "20, Jalan ABC 12/2,", address_2: "Kawasan Perindustrian, Jalan Besar", postcode: "43000", city: "Subang", state: "Selangor", country: "Malaysia", website_url: "www.google.com", facebook_url: "www.google.com", instagram_url: "www.google.com", twitter_url: "www.google.com", linkedin_url: "www.google.com"}, #organizer_id: 1
    {user_id: 6, company_name: "Saving Environment", email: "company2@gmail.com", address_1: "20, Jalan ABC 12/2,", address_2: "Kawasan Perindustrian, Jalan Besar", postcode: "43000", city: "Subang", state: "Selangor", country: "Malaysia", website_url: "www.google.com", facebook_url: "www.google.com", instagram_url: "www.google.com", twitter_url: "www.google.com", linkedin_url: "www.google.com"}, #organizer_id: 2
    {user_id: 8, company_name: "Chi Ji Association", email: "company3@gmail.com", address_1: "20, Jalan ABC 12/2,", address_2: "Kawasan Perindustrian, Jalan Besar", postcode: "43000", city: "Subang", state: "Selangor", country: "Malaysia", website_url: "www.google.com", facebook_url: "www.google.com", instagram_url: "www.google.com", twitter_url: "www.google.com", linkedin_url: "www.google.com"}, #organizer_id: 3
    {user_id: 9, company_name: "Mercy Charity", email: "company4@gmail.com", address_1: "20, Jalan ABC 12/2,", address_2: "Kawasan Perindustrian, Jalan Besar", postcode: "43000", city: "Subang", state: "Selangor", country: "Malaysia", website_url: "www.google.com", facebook_url: "www.google.com", instagram_url: "www.google.com", twitter_url: "www.google.com", linkedin_url: "www.google.com"}, #organizer_id: 4
    # ID: 5-8 are actual organizers
    {user_id: 23, company_name: "Sunway Gospel", email: "orgnizer1@gobantu.com", address_1: "20, Jalan ABC 12/2,", address_2: "Kawasan Perindustrian, Jalan Besar", postcode: "43000", city: "Subang", state: "Selangor", country: "Malaysia", website_url: "www.google.com", facebook_url: "www.google.com", instagram_url: "www.google.com", twitter_url: "www.google.com", linkedin_url: "www.google.com"},
    {user_id: 24, company_name: "KALSOM Movement", email: "orgnizer2@gobantu.com", address_1: "20, Jalan ABC 12/2,", address_2: "Kawasan Perindustrian, Jalan Besar", postcode: "43000", city: "Subang", state: "Selangor", country: "Malaysia", website_url: "www.google.com", facebook_url: "www.google.com", twitter_url: "www.google.com", linkedin_url: "www.google.com"},
    {user_id: 25, company_name: "Calvalry Land", email: "orgnizer3@gobantu.com", address_1: "20, Jalan ABC 12/2,", address_2: "Kawasan Perindustrian, Jalan Besar", postcode: "43000", city: "Subang", state: "Selangor", country: "Malaysia", website_url: "www.google.com", facebook_url: "www.google.com", instagram_url: "www.google.com", linkedin_url: "www.google.com"},
    {user_id: 26, company_name: "Shelter", email: "orgnizer4@gobantu.com",  address_1: "20, Jalan ABC 12/2,", address_2: "Kawasan Perindustrian, Jalan Besar", postcode: "43000", city: "Subang", state: "Selangor", country: "Malaysia", website_url: "www.google.com", facebook_url: "www.google.com", instagram_url: "www.google.com", twitter_url: "www.google.com"}
])

# 1.3 When User Volunteered a project, he/she become volunteer
Volunteer.create!([
    {user_id: 1, linkedin_url: "www.google.com"}, #volunteer_id: 1
    {user_id: 6, linkedin_url: "www.google.com"}, #volunteer_id: 2
    {user_id: 7, linkedin_url: "www.google.com"}, #volunteer_id: 3
    {user_id: 9, linkedin_url: "www.google.com"}, #volunteer_id: 4
    # ID: 5 - 17 are actual volunteers
    {user_id: 10, linkedin_url: "www.google.com"},
    {user_id: 11, linkedin_url: "www.google.com"},
    {user_id: 12, linkedin_url: "www.google.com"},
    {user_id: 13, linkedin_url: "www.google.com"},
    {user_id: 14, linkedin_url: "www.google.com"},
    {user_id: 15, linkedin_url: "www.google.com"},
    {user_id: 16, linkedin_url: "www.google.com"},
    {user_id: 17, linkedin_url: "www.google.com"},
    {user_id: 18, linkedin_url: "www.google.com"},
    {user_id: 19, linkedin_url: "www.google.com"},
    {user_id: 20, linkedin_url: "www.google.com"},
    {user_id: 21, linkedin_url: "www.google.com"},
    {user_id: 22, linkedin_url: "www.google.com"}
])
  
# 1.4 When User Donate a project, he/she become donor
Donor.create!([
    {user_id: 5}, #donor_id: 1
    {user_id: 7}, #donor_id: 2
    {user_id: 8}, #donor_id: 3
    {user_id: 9}, #donor_id: 4
    {user_id: 18}
])

# ####################################################
# 2.0 Project Tables and related role/access
# ####################################################

# 2.1 Project Category for searching purpose and scalable
Category.create!([
    {name: "Any", description: "None"},
    {name: "Home", description: "None"},
    {name: "Community", description: "None"},
    {name: "Organization", description: "None"}
])

# 2.2 User Section and Role
Project.create!([
    {title: "Home Project 1", project_desc: "This is home project 1, we are helping under priviledge persons, at the moment we need abc with xyc, kindly support us", requirement_desc: "We need 11111 for aaaaa", city: "Petaling Jaya", state: "Selangor", country: "Malaysia", volunteer_number: 1, fund_amount: 1000, status: 2},
    {title: "Home Project 2", project_desc: "This is home project 2, we are helping under priviledge persons, at the moment we need def with rtc, kindly support us", requirement_desc: "We need 22222 for bbbbb", city: "Petaling Jaya", state: "Selangor", country: "Malaysia", volunteer_number: 1, fund_amount: 0, status: 2},
    {title: "Community Project 1", project_desc: "This is home project 1, we are helping under priviledge persons, at the moment we need def with rtc, kindly support us", requirement_desc: "We need 33333 for ccccc", city: "Petaling Jaya", state: "Selangor", country: "Malaysia", volunteer_number: 1, fund_amount: 300, status: 2},
    {title: "Community Project 2", project_desc: "This is home project 2, we are helping under priviledge persons, at the moment we need def with rtc, kindly support us", requirement_desc: "We need 44444 for ddddd", city: "Petaling Jaya", state: "Selangor", country: "Malaysia", volunteer_number: 2, fund_amount: 200, status: 2},
    {title: "Organization Project 1", project_desc: "This is home project 1, we are helping under priviledge persons, at the moment we need def with rtc, kindly support us", requirement_desc: "We need 55555 for eeeee", city: "Petaling Jaya", state: "Selangor", country: "Malaysia", volunteer_number: 1, fund_amount: 500, status: 2},
    {title: "Organization Project 2", project_desc: "This is home project 2, we are helping under priviledge persons, at the moment we need def with rtc, kindly support us", requirement_desc: "We need 66666 for fffff", city: "Petaling Jaya", state: "Selangor", country: "Malaysia", volunteer_number: 1, fund_amount: 900, status: 2},
    {title: "Home Project 3", project_desc: "This is home project 3, we are helping under priviledge persons, at the moment we need def with rtc, kindly support us", requirement_desc: "We need 77777 for ggggg", city: "Petaling Jaya", state: "Selangor", country: "Malaysia", volunteer_number: 1, fund_amount: 800, status: 2},
    {title: "Home Project 4", project_desc: "This is home project 4, we are helping under priviledge persons, at the moment we need def with rtc, kindly support us", requirement_desc: "We need 88888 for hhhhh", city: "Petaling Jaya", state: "Selangor", country: "Malaysia", volunteer_number: 2, fund_amount: 600, status: 2},
    {title: "Community Project 3", project_desc: "This is home project 3, we are helping under priviledge persons, at the moment we need def with rtc, kindly support us", requirement_desc: "We need 99999 for iiiii", city: "Petaling Jaya", state: "Selangor", country: "Malaysia", volunteer_number: 1, fund_amount: 500, status: 2},
    {title: "Community Project 4",  project_desc: "This is home project 4, we are helping under priviledge persons, at the moment we need def with rtc, kindly support us", requirement_desc: "We need 00000 for jjjjj", city: "Petaling Jaya", state: "Selangor", country: "Malaysia", volunteer_number: 2, fund_amount: 2000, status: 2},
    {title: "Organization Project 3", project_desc: "This is home project 3, we are helping under priviledge persons, at the moment we need def with rtc, kindly support us", requirement_desc: "We need 10101 for kkkkk", city: "Petaling Jaya", state: "Selangor", country: "Malaysia", volunteer_number: 1, fund_amount: 1200, status: 2},
    {title: "Organization Project 4", project_desc: "This is home project 4, we are helping under priviledge persons, at the moment we need def with rtc, kindly support us", requirement_desc: "We need 20202 for aaaaa", city: "Petaling Jaya", state: "Selangor", country: "Malaysia", status: 1},
    {title: "Organization Project 5", project_desc: "This is home project 5, we are helping under priviledge persons, at the moment we need def with rtc, kindly support us", requirement_desc: "We need 30303 for ccccc", city: "Petaling Jaya", state: "Selangor", country: "Malaysia", status: 0},
    # ID 14-17 are actual projects
    {title: "English Tutor for Children", project_desc: "Bandar Sunway Gospel Centre is looking 2 English Tutor", requirement_desc: "We need english tutor 2h for every saturday", volunteer_number: 2, city: "Subang", state: "Selangor", country: "Malaysia", status: 2},
    {title: "Auditor for KALSOM Movement", project_desc: "KALSOM Movement is looking for Auditor/Accountant", requirement_desc: "We need an Auditor/Accountant to help audit our account", volunteer_number: 1, city: "Subang", state: "Selangor", country: "Malaysia", status: 2},
    {title: "Calvalry Land", project_desc: "Looking for Agriculture Expert to cultivate our land", requirement_desc: "We need a Agriculture Expert for consultation", volunteer_number: 1, city: "Sepang", state: "Selangor", country: "Malaysia", status: 2},
    {title: "Digital Marketer Shelter Home", project_desc: "We are looking for Digital Marketer to help us promote our goal and mission", requirement_desc: "We are looking for peoples to improve", volunteer_number: 2, city: "Petaling Jaya", state: "Selangor", country: "Malaysia", status: 2}
])

# ####################################################
# 3.0 Match-able Tables matching system
# ####################################################

Skill.create!([
    {name: "Accounting"}, #1
    {name: "Agriculture"}, #2
    {name: "Cooking"}, #3
    {name: "Chess"}, #4
    {name: "Computer"}, #5
    {name: "Dancing"}, #6
    {name: "Electrical"}, #7
    {name: "Healthcare"}, #8
    {name: "Financing"}, #9
    {name: "Marketing"}, #10
    {name: "Mechanical"}, #11
    {name: "Medical"}, #12
    {name: "Music Instrumenting"}, #13
    {name: "Motivator"}, #14
    {name: "Programming"}, #15
    {name: "Plumbing"}, #16
    {name: "Teaching"}, #17
    {name: "Training"}, #18
    {name: "Digital Marketing"}, #19
    {name: "Others"} #20
])

Profession.create!([
    {name: "Accountant"}, #1
    {name: "Actuarial Science"}, #2
    {name: "Agriculturist"}, #3
    {name: "Auditor"}, #4
    {name: "Artist"}, #5
    {name: "Business"}, #6
    {name: "Consultant"}, #7
    {name: "Carpenter"}, #8
    {name: "Finance"}, #9
    {name: "Doctor"}, #10
    {name: "Dentist"}, #11
    {name: "Engineer"}, #12
    {name: "Emcee"}, #13
    {name: "Farmer"}, #14
    {name: "Human Resources"}, #15
    {name: "Lawyer"}, #16
    {name: "Musician"}, #17
    {name: "Mathematician"}, #18
    {name: "Nurse"}, #19
    {name: "Public Relation"}, #20
    {name: "Physiotheraphy"}, #21
    {name: "Programmer"}, #22
    {name: "Singer"}, #23
    {name: "Student"}, #24
    {name: "Teacher"}, #25
    {name: "Web Developer"}, #26
    {name: "Web Marketer"}, #27
    {name: "Others"} #28
])

Cause.create!([
    {name: "Homeless and Housing"},
    {name: "Environment"},
    {name: "Education"},
    {name: "Indegenious"},
    {name: "Medical"},
    {name: "Science"},
    {name: "Religion"},
    {name: "Animals"},
    {name: "Crisis Support"},
    {name: "Disable Peoples"}
])

#Location?

# ####################################################
# 4.0 Join Tables for easier query and database auditable
# ####################################################

ProjectCategoryJoin.create!([
    {project_id: 1, category_id: 2},
    {project_id: 2, category_id: 2},
    {project_id: 3, category_id: 3},
    {project_id: 4, category_id: 3},
    {project_id: 5, category_id: 4},
    {project_id: 6, category_id: 4},
    {project_id: 7, category_id: 2},
    {project_id: 8, category_id: 2},
    {project_id: 9, category_id: 3},
    {project_id: 10, category_id: 3},
    {project_id: 11, category_id: 4},
    {project_id: 12, category_id: 4},
    {project_id: 13, category_id: 4},
    # Actual Projects
    {project_id: 14, category_id: 4},
    {project_id: 15, category_id: 4},
    {project_id: 16, category_id: 4},
    {project_id: 17, category_id: 4}
])

OrganizerProjectJoin.create!([
    {organizer_id: 1, project_id: 1},
    {organizer_id: 1, project_id: 2},
    {organizer_id: 2, project_id: 3},
    {organizer_id: 2, project_id: 4},
    {organizer_id: 3, project_id: 5},
    {organizer_id: 3, project_id: 6},
    {organizer_id: 1, project_id: 7},
    {organizer_id: 1, project_id: 8},
    {organizer_id: 2, project_id: 9},
    {organizer_id: 2, project_id: 10},
    {organizer_id: 3, project_id: 11},
    {organizer_id: 3, project_id: 12},
    {organizer_id: 3, project_id: 13},
    # Actual Projects
    {organizer_id: 5, project_id: 14},
    {organizer_id: 6, project_id: 15},
    {organizer_id: 7, project_id: 16},
    {organizer_id: 8, project_id: 17}

])

VolunteerProjectJoin.create!([
    {volunteer_id: 1, project_id: 1},
    {volunteer_id: 1, project_id: 2},
    {volunteer_id: 2, project_id: 3},
    {volunteer_id: 2, project_id: 4},
    {volunteer_id: 3, project_id: 5},
    {volunteer_id: 3, project_id: 6},
    {volunteer_id: 1, project_id: 7},
    {volunteer_id: 1, project_id: 8},
    {volunteer_id: 2, project_id: 9},
    {volunteer_id: 2, project_id: 10},
    {volunteer_id: 3, project_id: 11},
    {volunteer_id: 3, project_id: 12},
    {volunteer_id: 3, project_id: 13}
])

Donation.create!([
    {donor_id: 1, project_id: 1, amount: 1000},
    {donor_id: 2, project_id: 3, amount: 200},
    {donor_id: 2, project_id: 4, amount: 100},
    {donor_id: 3, project_id: 5, amount: 500},
    {donor_id: 3, project_id: 6, amount: 900},
    {donor_id: 1, project_id: 7, amount: 400},
    {donor_id: 1, project_id: 8, amount: 100},
    {donor_id: 2, project_id: 9, amount: 300},
    {donor_id: 2, project_id: 10, amount: 1100},
    {donor_id: 3, project_id: 11, amount: 1200},
    {donor_id: 5, project_id: 10, amount: 100, status: 1},
    {donor_id: 5, project_id: 10, amount: 100, status: 1},
    {donor_id: 5, project_id: 10, amount: 100, status: 1}
])

# For Searching or Matching

VolunteerCauseJoin.create!([
    {volunteer_id: 1, cause_id: 1},
    {volunteer_id: 2, cause_id: 2},
    {volunteer_id: 3, cause_id: 3},
    {volunteer_id: 4, cause_id: 4},
    {volunteer_id: 5, cause_id: 5},
    {volunteer_id: 6, cause_id: 6},
    {volunteer_id: 7, cause_id: 7},
    {volunteer_id: 8, cause_id: 8},
    {volunteer_id: 9, cause_id: 9},
    {volunteer_id: 10, cause_id: 1},
    {volunteer_id: 10, cause_id: 6},
    {volunteer_id: 11, cause_id: 5},
    {volunteer_id: 11, cause_id: 8},
    {volunteer_id: 12, cause_id: 6},
    {volunteer_id: 13, cause_id: 7},
    {volunteer_id: 14, cause_id: 8},
    {volunteer_id: 15, cause_id: 9},
    {volunteer_id: 16, cause_id: 1},
    {volunteer_id: 16, cause_id: 2},
    {volunteer_id: 16, cause_id: 3},
    {volunteer_id: 17, cause_id: 1}
])

# Volunteer

VolunteerSkillJoin.create!([
    {volunteer_id: 1, skill_id: 1},
    {volunteer_id: 1, skill_id: 2},
    {volunteer_id: 1, skill_id: 3},
    {volunteer_id: 2, skill_id: 4},
    {volunteer_id: 2, skill_id: 5},
    {volunteer_id: 2, skill_id: 6},
    {volunteer_id: 3, skill_id: 7},
    {volunteer_id: 3, skill_id: 8},
    {volunteer_id: 3, skill_id: 9},
    {volunteer_id: 4, skill_id: 2},
    {volunteer_id: 4, skill_id: 4},
    {volunteer_id: 4, skill_id: 6},
    {volunteer_id: 4, skill_id: 8},
    # Actual Volunteers
    {volunteer_id: 5, skill_id: 17, remarks: "Mathematics and Chess"},
    {volunteer_id: 6, skill_id: 17, remarks: ""},
    {volunteer_id: 7, skill_id: 17, remarks: "English and Math"},
    {volunteer_id: 8, skill_id: 17, remarks: "Teaching for ?"},
    {volunteer_id: 8, skill_id: 18, remarks: "Training for ?"},
    {volunteer_id: 9, skill_id: 1, remarks: "Accounting and Auditor"},
    {volunteer_id: 10, skill_id: 17, remarks: "Motivational Speech"},
    {volunteer_id: 11, skill_id: 17, remarks: "English, Strategy Development"},
    {volunteer_id: 12, skill_id: 2, remarks: "Common plantations and Agriculture consultant"},
    {volunteer_id: 13, skill_id: 17, remarks: "Teacher"},
    {volunteer_id: 14, skill_id: 19, remarks: "Digital Marketing Facebook, Ad Words, etc"},
    {volunteer_id: 15, skill_id: 8, remarks: "Physiotheraphy"},
    {volunteer_id: 15, skill_id: 12, remarks: "Physiotheraphy"},
    {volunteer_id: 16, skill_id: 17, remarks: "Languages and Mathematics"}

])

VolunteerProfessionJoin.create!([
    {volunteer_id: 1, profession_id: 1},
    {volunteer_id: 2, profession_id: 4},
    {volunteer_id: 3, profession_id: 6},
    {volunteer_id: 4, profession_id: 9},
    # Actual Volunteers
    {volunteer_id: 5, profession_id: 2, remarks: "Actuarial Science"},
    {volunteer_id: 6, profession_id: 16, remarks: "Lawyer"},
    {volunteer_id: 7, profession_id: 24, remarks: "Biomedical Student"},
    {volunteer_id: 8, profession_id: 15, remarks: "Human Resources"},
    {volunteer_id: 9, profession_id: 1, remarks: "Auditor"},
    {volunteer_id: 9, profession_id: 4, remarks: "Accounting"},
    {volunteer_id: 10, profession_id: 24, remarks: "Civil Engineering"},
    {volunteer_id: 11, profession_id: 7, remarks: "Strategy Consultant"},
    {volunteer_id: 12, profession_id: 3, remarks: "Agriculturist"},
    {volunteer_id: 13, profession_id: 16, remarks: "Lawyer"},
    {volunteer_id: 14, profession_id: 16, remarks: "Lawyer"},
    {volunteer_id: 15, profession_id: 27, remarks: "Digital Marketer"},
    {volunteer_id: 16, profession_id: 21, remarks: "Physiotheraphy"},
    {volunteer_id: 17, profession_id: 16, remarks: "Lawyer"}
])


# Project
ProjectCauseJoin.create!([
    {project_id: 1, cause_id: 1},
    {project_id: 3, cause_id: 2},
    {project_id: 3, cause_id: 1},
    {project_id: 4, cause_id: 4},
    {project_id: 4, cause_id: 5},
    {project_id: 4, cause_id: 6},
    {project_id: 5, cause_id: 7},
    {project_id: 5, cause_id: 8},
    {project_id: 5, cause_id: 9},
    {project_id: 16, cause_id: 1}
])

ProjectSkillJoin.create!([
    {project_id: 1, skill_id: 1},
    {project_id: 3, skill_id: 2},
    {project_id: 3, skill_id: 3},
    {project_id: 4, skill_id: 4},
    {project_id: 4, skill_id: 5},
    {project_id: 4, skill_id: 6},
    {project_id: 5, skill_id: 7},
    {project_id: 5, skill_id: 8},
    {project_id: 5, skill_id: 9},
    # Actual Projects
    {project_id: 14, skill_id: 17, remarks: "Teacher"},
    {project_id: 15, skill_id: 1, remarks: "Accounting / Auditor"},
    {project_id: 16, skill_id: 2, remarks: "Farmer / Agriculturist / Consultant"},
    {project_id: 17, skill_id: 19, remarks: "Digital Marketing"}
])

ProjectProfessionJoin.create!([
    {project_id: 1, profession_id: 1},
    {project_id: 2, profession_id: 2},
    {project_id: 3, profession_id: 1},
    {project_id: 4, profession_id: 4},
    {project_id: 5, profession_id: 5},
    {project_id: 6, profession_id: 6},
    {project_id: 7, profession_id: 7},
    {project_id: 8, profession_id: 8},
    {project_id: 9, profession_id: 9},
    # Actual Projects
    {project_id: 14, profession_id: 25, remarks: "English"},
    {project_id: 15, profession_id: 4, remarks: "Accounting / Auditor"},
    {project_id: 16, profession_id: 3, remarks: "Farmer / Agriculturist / Consultant"},
    {project_id: 17, profession_id: 27, remarks: "Digital Marketing"}
])


