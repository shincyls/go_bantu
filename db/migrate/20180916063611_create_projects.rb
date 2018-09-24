class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.references :volunteer, index: true
      t.string :title, limit: 128
      t.text :project_desc
      t.text :requirement_desc

      ## Enum for Project Type (personal? home? organization?)
      t.integer :type, default: 0

      ## Funding Amount
      t.float :fund_amount, default: 0

      ## Requirement
      t.string :skill
      t.string :profession
      t.string :skill

      ## Contact and Location (temporary allow to key anything)
      t.string :contact_person_1
      t.string :contact_number_1
      t.string :contact_person_2
      t.string :contact_number_2
      t.string :address_1, limit: 32
      t.string :address_2, limit: 32
      t.string :postcode, limit: 5
      t.string :city #free to key-in
      t.string :state #select option
      t.string :country #select option

      t.timestamps
    end
  end
end
