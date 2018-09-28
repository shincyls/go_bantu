class CreateProjectProfessionJoins < ActiveRecord::Migration[5.2]
  def change
    create_table :project_profession_joins do |t|
      t.references :project, index: true
      t.references :profession, index: true
      t.timestamps
    end
  end
end
