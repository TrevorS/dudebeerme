class RemoveNameFromInterestedBrewers < ActiveRecord::Migration
  def change
    remove_column :interested_brewers, :name
  end
end
