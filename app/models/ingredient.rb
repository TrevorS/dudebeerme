# == Schema Information
#
# Table name: ingredients
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  quantity   :float
#  unit       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Ingredient < ActiveRecord::Base

  # each ingredient belongs to a recipe.
  belongs_to :recipe

  # setup accessible attributes for for ingredient.
  attr_accessible :name, :quantity, :unit
end
