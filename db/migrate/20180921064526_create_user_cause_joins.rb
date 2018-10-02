class CreateUserCauseJoins < ActiveRecord::Migration[5.2]
  def change
    create_table :user_cause_joins do |t|
      t.references :user, index: true
      t.references :cause, index: true
      t.string :remarks
      t.timestamps
    end
  end
end
