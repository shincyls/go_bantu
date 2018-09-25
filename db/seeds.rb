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
    {title: "Home Project 1", category_id: 2, project_desc: "This is home project 1, bla bla bla", requirement_desc: "We need xxxxxxx for yyyyyyyy", city: "Petaling Jaya", state: "Selangor", country: "Malaysia", fund_amount: 1000},
    {title: "Home Project 2", category_id: 2, project_desc: "This is home project 1, bla bla bla", requirement_desc: "We need xxxxxxx for yyyyyyyy", city: "Petaling Jaya", state: "Selangor", country: "Malaysia", fund_amount: 0},
    {title: "Community Project 1", category_id: 3, project_desc: "This is home project 1, bla bla bla", requirement_desc: "We need xxxxxxx for yyyyyyyy", city: "Petaling Jaya", state: "Selangor", country: "Malaysia", fund_amount: 300},
    {title: "Community Project 2", category_id: 3, project_desc: "This is home project 1, bla bla bla", requirement_desc: "We need xxxxxxx for yyyyyyyy", city: "Petaling Jaya", state: "Selangor", country: "Malaysia", fund_amount: 200},
    {title: "Organization Project 1", category_id: 4, project_desc: "This is home project 1, bla bla bla", requirement_desc: "We need xxxxxxx for yyyyyyyy", city: "Petaling Jaya", state: "Selangor", country: "Malaysia", fund_amount: 500},
    {title: "Organization Project 2", category_id: 4, project_desc: "This is home project 1, bla bla bla", requirement_desc: "We need xxxxxxx for yyyyyyyy", city: "Petaling Jaya", state: "Selangor", country: "Malaysia", fund_amount: 900},
    {title: "Home Project 3", category_id: 2, project_desc: "This is home project 1, bla bla bla", requirement_desc: "We need xxxxxxx for yyyyyyyy", city: "Petaling Jaya", state: "Selangor", country: "Malaysia", fund_amount: 800},
    {title: "Home Project 4", category_id: 2, project_desc: "This is home project 1, bla bla bla", requirement_desc: "We need xxxxxxx for yyyyyyyy", city: "Petaling Jaya", state: "Selangor", country: "Malaysia", fund_amount: 600},
    {title: "Community Project 1", category_id: 3, project_desc: "This is home project 1, bla bla bla", requirement_desc: "We need xxxxxxx for yyyyyyyy", city: "Petaling Jaya", state: "Selangor", country: "Malaysia", fund_amount: 500},
    {title: "Community Project 2", category_id: 3,  project_desc: "This is home project 1, bla bla bla", requirement_desc: "We need xxxxxxx for yyyyyyyy", city: "Petaling Jaya", state: "Selangor", country: "Malaysia", fund_amount: 2000},
    {title: "Organization Project 3", category_id: 4, project_desc: "This is home project 1, bla bla bla", requirement_desc: "We need xxxxxxx for yyyyyyyy", city: "Petaling Jaya", state: "Selangor", country: "Malaysia", fund_amount: 1200},
    {title: "Organization Project 4", category_id: 4, project_desc: "This is home project 1, bla bla bla", requirement_desc: "We need xxxxxxx for yyyyyyyy", city: "Petaling Jaya", state: "Selangor", country: "Malaysia"},
    {title: "Organization Project 5", category_id: 4, project_desc: "This is home project 1, bla bla bla", requirement_desc: "We need xxxxxxx for yyyyyyyy", city: "Petaling Jaya", state: "Selangor", country: "Malaysia"}
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
    {name: "Web Developer"}
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

ProjectCategoryJoin.create!([])

OrganizerProjectJoin.create!([])

VolunteerProjectJoin.create!([])

DonorProjectJoin.create!([])

# For Searching or Matching

UserCauseJoin.create!([])

# Volunteer

VolunteerSkillJoin.create!([])

VolunteerProfessionJoin.create!([])




