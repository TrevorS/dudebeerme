class CreateInterestedBrewers < ActiveRecord::Migration
  def change
    create_table :interested_brewers do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
