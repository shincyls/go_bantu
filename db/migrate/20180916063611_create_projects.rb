class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title, limit: 128
      t.text :project_desc
      t.text :requirement_desc

      ## Enum for Project Type (personal? home? organization?)
       # t.references :category, index: true

      ## Contact and Location (temporary allow to key anything)
      t.string :contact_person_1
      t.string :contact_number_1
      t.string :contact_person_2
      t.string :contact_number_2
      t.string :address_1, limit: 64
      t.string :address_2, limit: 64
      t.string :postcode, limit: 5
      t.string :city #free to key-in
      t.string :state #select option
      t.string :country #select option

      ## Campaign Date, Project Page will only show >start_date and <end_date
      t.date :start_date, default: "2018-01-01"
      t.date :end_date, default: "2020-12-31"

      ## Number of Volunteer Needed
      t.integer :voulunteer_number, default: 0

      ## Funding Amount
      t.float :fund_amount, default: 0

      ## Requirement and Status
      t.boolean :volunteer, default: true #if false, will not display volunteer option
      t.boolean :finance_donate, default: true #if false, will not display finance donate option
      t.boolean :material_donate, default: false #if false, will not display mats donate option
      t.boolean :active, default: true #if false, will not display in project_path

      ## Causes / Skills / Professions
      ## While using join tables, not neccessary to create here
      ## we can use project.causes.each / project.skills.each / project.professions.each

      t.timestamps
    end
  end
end
