class AddHierarchyForRecipes < ActiveRecord::Migration

  def change
    create_table :recipe_hierarchies, id: false do |t|
      # ID of the parent/grandparent/great-grandparent
      t.integer  :ancestor_id,   null: false
      # ID of the target recipe
      t.integer  :descendant_id, null: false
      # Number of generations between the ancestor and the descendant.
      t.integer  :generations,   null: false
    end

    # For "all progeny of..." selects:
    add_index :recipe_hierarchies, [:ancestor_id, :descendant_id], unique: true

    # For "all ancestors of..." selects:
    add_index :recipe_hierarchies, [:descendant_id]
  end
end
