class CreateVolunteerProfessionJoins < ActiveRecord::Migration[5.2]
  def change
    create_table :volunteer_profession_joins do |t|
      t.references :volunteer, index: true
      t.references :profession, index: true
      t.timestamps
    end
  end
end
