class CreateProjectCategoryJoins < ActiveRecord::Migration[5.2]
  def change
    create_table :project_category_joins do |t|
      t.references :project, index: true
      t.references :category, index: true
      t.timestamps
    end
  end
end
