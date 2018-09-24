class CreateVolunteers < ActiveRecord::Migration[5.2]
  def change
    create_table :volunteers do |t|
      ## Volunteer Skills and CV
      t.references :user, index: true
      t.string :cv_file
      t.string :linked_in_url
      t.timestamps
    end
  end
end
