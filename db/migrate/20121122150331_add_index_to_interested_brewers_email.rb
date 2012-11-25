class AddIndexToInterestedBrewersEmail < ActiveRecord::Migration
  def change
    add_index :interested_brewers, :email, unique: true
  end
end
