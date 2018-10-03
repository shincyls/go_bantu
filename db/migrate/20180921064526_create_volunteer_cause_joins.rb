class CreateVolunteerCauseJoins < ActiveRecord::Migration[5.2]
  def change
    create_table :volunteer_cause_joins do |t|
      t.references :volunteer, index: true
      t.references :cause, index: true
      t.string :remarks
      t.timestamps
    end
  end
end
