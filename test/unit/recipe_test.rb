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
#  parent_id   :integer
#

require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
