# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




User.create!([
    {username: "admin", first_name: "Admin", last_name: "Im", email: "admin@gobantu.com", password: "qwerasdf", role: 0},
    {username: "manager", first_name: "Manager", last_name: "Im", email: "company@gobantu.com", password: "qwerasdf", role: 0},
    {username: "user1", first_name: "User", last_name: "One", email: "user1@gobantu.com", password: "qwerasdf", role: 1},
    {username: "user2", first_name: "User", last_name: "Two", email: "user2@gobantu.com", password: "qwerasdf", role: 1},
    {username: "user3", first_name: "User", last_name: "Three", email: "user3@gobantu.com", password: "qwerasdf", role: 1}
  ])

Category.create!([
    {name: "Any", description: "None"},
    {name: "Home", description: "None"},
    {name: "Community", description: "None"},
    {name: "Organization", description: "None"}
])

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