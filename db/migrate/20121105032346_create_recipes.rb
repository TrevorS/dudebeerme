class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :style
      t.string :picture
      t.float :o_gravity
      t.float :f_gravity
      t.string :description

      t.timestamps
    end
  end
end
