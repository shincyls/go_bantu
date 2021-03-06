class CreateVolunteers < ActiveRecord::Migration[5.2]
  def change
    create_table :volunteers do |t|
      ## Volunteer Skills and CV
      t.references :user, index: true
      t.string :description
      t.string :cv_file
      t.string :linkedin_url
      t.timestamps
    end
  end
end
