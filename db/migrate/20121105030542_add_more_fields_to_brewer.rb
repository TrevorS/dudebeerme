class AddMoreFieldsToBrewer < ActiveRecord::Migration
  def change
    add_column :brewers, :name, :string
    add_column :brewers, :location, :string
    add_column :brewers, :rating, :integer
    add_column :brewers, :profile, :string
  end
end
