# == Schema Information
#
# Table name: recipes
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  style       :string(255)
#  picture     :string(255)
#  o_gravity   :float
#  f_gravity   :float
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Recipe < ActiveRecord::Base

  # each recipe belongs to a brewer.
  belongs_to :brewer

  # setup accessible attributes for recipe.
  attr_accessible :description, :f_gravity, :name, :o_gravity, :picture, :style
end
