# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ####################################################
# 1.0 User Tables and related role/access
# ####################################################

# 1.1 User Section and Role
User.create!([
    {username: "admin", first_name: "Admin", last_name: "Im", email: "admin@gobantu.com", password: "qwerasdf", role: 0},
    {username: "manager", first_name: "Manager", last_name: "Im", email: "company@gobantu.com", password: "qwerasdf", role: 0},
    {username: "volunteer", first_name: "Volunteer", last_name: "Im", email: "user1@gobantu.com", password: "qwerasdf", role: 1},
    {username: "organizer", first_name: "Organizer", last_name: "Im", email: "user2@gobantu.com", password: "qwerasdf", role: 1},
    {username: "donor", first_name: "Donor", last_name: "Im", email: "user3@gobantu.com", password: "qwerasdf", role: 1},
    {username: "vol_org", first_name: "Volunteer", last_name: "Orgnizer", email: "user4@gobantu.com", password: "qwerasdf", role: 1},
    {username: "vol_donor", first_name: "Volunteer", last_name: "Donor", email: "user5@gobantu.com", password: "qwerasdf", role: 1},
    {username: "org_donor", first_name: "Organizer", last_name: "Donor", email: "user6@gobantu.com", password: "qwerasdf", role: 1},
    {username: "anyuser", first_name: "Any", last_name: "User", email: "user7@gobantu.com", password: "qwerasdf", role: 1}
  ])

# 1.2 When User hosted a project, he/she become organizer
Organizer.create!([
    {user_id: 4, company_name: "Indegenious Community", email: "company1@gmail.com"}, #organizer_id: 1
    {user_id: 6, company_name: "Saving Environment", email: "company2@gmail.com"}, #organizer_id: 2
    {user_id: 8, company_name: "Helpful People", email: "company3@gmail.com"}, #organizer_id: 3
    {user_id: 9, company_name: "Helpful Charity", email: "company4@gmail.com"} #organizer_id: 4
])

# 1.3 When User Volunteered a project, he/she become volunteer
Volunteer.create!([
    {user_id: 3, linked_in_url: "www.google.com"}, #volunteer_id: 1
    {user_id: 6, linked_in_url: "www.google.com"}, #volunteer_id: 2
    {user_id: 7, linked_in_url: "www.google.com"}, #volunteer_id: 3
    {user_id: 9, linked_in_url: "www.google.com"} #volunteer_id: 4
])
  
# 1.4 When User Donate a project, he/she become donor
Donor.create!([
    {user_id: 5}, #donor_id: 1
    {user_id: 7}, #donor_id: 2
    {user_id: 8}, #donor_id: 3
    {user_id: 9} #donor_id: 4
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
    {title: "Home Project 1", project_desc: "This is home project 1, bla bla bla", requirement_desc: "We need 11111 for aaaaa", city: "Petaling Jaya", state: "Selangor", country: "Malaysia", volunteer_number: 1, fund_amount: 1000, status: 2},
    {title: "Home Project 2", project_desc: "This is home project 1, bla bla bla", requirement_desc: "We need 22222 for bbbbb", city: "Petaling Jaya", state: "Selangor", country: "Malaysia", volunteer_number: 1, fund_amount: 0, status: 2},
    {title: "Community Project 1", project_desc: "This is home project 1, bla bla bla", requirement_desc: "We need 33333 for ccccc", city: "Petaling Jaya", state: "Selangor", country: "Malaysia", volunteer_number: 1, fund_amount: 300, status: 2},
    {title: "Community Project 2", project_desc: "This is home project 1, bla bla bla", requirement_desc: "We need 44444 for ddddd", city: "Petaling Jaya", state: "Selangor", country: "Malaysia", volunteer_number: 2, fund_amount: 200, status: 2},
    {title: "Organization Project 1", project_desc: "This is home project 1, bla bla bla", requirement_desc: "We need 55555 for eeeee", city: "Petaling Jaya", state: "Selangor", country: "Malaysia", volunteer_number: 1, fund_amount: 500, status: 2},
    {title: "Organization Project 2", project_desc: "This is home project 1, bla bla bla", requirement_desc: "We need 66666 for fffff", city: "Petaling Jaya", state: "Selangor", country: "Malaysia", volunteer_number: 1, fund_amount: 900, status: 2},
    {title: "Home Project 3", project_desc: "This is home project 1, bla bla bla", requirement_desc: "We need 77777 for ggggg", city: "Petaling Jaya", state: "Selangor", country: "Malaysia", volunteer_number: 1, fund_amount: 800, status: 2},
    {title: "Home Project 4", project_desc: "This is home project 1, bla bla bla", requirement_desc: "We need 88888 for hhhhh", city: "Petaling Jaya", state: "Selangor", country: "Malaysia", volunteer_number: 2, fund_amount: 600, status: 2},
    {title: "Community Project 1", project_desc: "This is home project 1, bla bla bla", requirement_desc: "We need 99999 for iiiii", city: "Petaling Jaya", state: "Selangor", country: "Malaysia", volunteer_number: 1, fund_amount: 500, status: 2},
    {title: "Community Project 2",  project_desc: "This is home project 1, bla bla bla", requirement_desc: "We need 00000 for jjjjj", city: "Petaling Jaya", state: "Selangor", country: "Malaysia", volunteer_number: 2, fund_amount: 2000, status: 2},
    {title: "Organization Project 3", project_desc: "This is home project 1, bla bla bla", requirement_desc: "We need 10101 for kkkkk", city: "Petaling Jaya", state: "Selangor", country: "Malaysia", volunteer_number: 1, fund_amount: 1200, status: 2},
    {title: "Organization Project 4", project_desc: "This is home project 1, bla bla bla", requirement_desc: "We need 20202 for aaaaa", city: "Petaling Jaya", state: "Selangor", country: "Malaysia", status: 1},
    {title: "Organization Project 5", project_desc: "This is home project 1, bla bla bla", requirement_desc: "We need 30303 for ccccc", city: "Petaling Jaya", state: "Selangor", country: "Malaysia", status: 0}
])

# ####################################################
# 3.0 Match-able Tables matching system
# ####################################################

Skill.create!([
    {name: "Cooking"},
    {name: "Medical"},
    {name: "Electrical"},
    {name: "Plumbing"},
    {name: "Mechanical"},
    {name: "Digital Marketing"},
    {name: "Marketing"},
    {name: "Accounting"},
    {name: "Music"}
])

Profession.create!([
    {name: "Doctor"},
    {name: "Dentist"},
    {name: "Nurse"},
    {name: "Teacher"},
    {name: "Musician"},
    {name: "Accountant"},
    {name: "Artist"},
    {name: "Web Developer"},
    {name: "Web Marketer"}
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
    {project_id: 13, category_id: 4}
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
    {organizer_id: 3, project_id: 13}
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

DonorProjectJoin.create!([
    {donor_id: 1, project_id: 1, amount: 1000},
    {donor_id: 2, project_id: 3, amount: 200},
    {donor_id: 2, project_id: 4, amount: 100},
    {donor_id: 3, project_id: 5, amount: 500},
    {donor_id: 3, project_id: 6, amount: 900},
    {donor_id: 1, project_id: 7, amount: 400},
    {donor_id: 1, project_id: 8, amount: 100},
    {donor_id: 2, project_id: 9, amount: 300},
    {donor_id: 2, project_id: 10, amount: 1100},
    {donor_id: 3, project_id: 11, amount: 1200}
])

# For Searching or Matching

UserCauseJoin.create!([
    {user_id: 3, cause_id: 1},
    {user_id: 3, cause_id: 2},
    {user_id: 3, cause_id: 3},
    {user_id: 4, cause_id: 4},
    {user_id: 4, cause_id: 5},
    {user_id: 4, cause_id: 6},
    {user_id: 5, cause_id: 7},
    {user_id: 5, cause_id: 8},
    {user_id: 5, cause_id: 9}
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
    {volunteer_id: 4, skill_id: 8}
])

VolunteerProfessionJoin.create!([
    {volunteer_id: 1, profession_id: 1},
    {volunteer_id: 2, profession_id: 4},
    {volunteer_id: 3, profession_id: 6},
    {volunteer_id: 4, profession_id: 9}
])


# Project
ProjectCauseJoin.create!([
    {project_id: 3, cause_id: 1},
    {project_id: 3, cause_id: 2},
    {project_id: 3, cause_id: 3},
    {project_id: 4, cause_id: 4},
    {project_id: 4, cause_id: 5},
    {project_id: 4, cause_id: 6},
    {project_id: 5, cause_id: 7},
    {project_id: 5, cause_id: 8},
    {project_id: 5, cause_id: 9}
])

ProjectSkillJoin.create!([
    {project_id: 3, skill_id: 1},
    {project_id: 3, skill_id: 2},
    {project_id: 3, skill_id: 3},
    {project_id: 4, skill_id: 4},
    {project_id: 4, skill_id: 5},
    {project_id: 4, skill_id: 6},
    {project_id: 5, skill_id: 7},
    {project_id: 5, skill_id: 8},
    {project_id: 5, skill_id: 9}
])

ProjectProfessionJoin.create!([
    {project_id: 1, profession_id: 1},
    {project_id: 2, profession_id: 2},
    {project_id: 3, profession_id: 3},
    {project_id: 4, profession_id: 4},
    {project_id: 5, profession_id: 5},
    {project_id: 6, profession_id: 6},
    {project_id: 7, profession_id: 7},
    {project_id: 8, profession_id: 8},
    {project_id: 9, profession_id: 9}
])




