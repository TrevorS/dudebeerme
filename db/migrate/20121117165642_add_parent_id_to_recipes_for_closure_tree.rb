class AddParentIdToRecipesForClosureTree < ActiveRecord::Migration
  def change
    add_column :recipes, :parent_id, :integer
  end
end
