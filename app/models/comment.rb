# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  rating     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ActiveRecord::Base

  # each comment belongs to a brewer and a recipe.
  belongs_to :brewer
  belongs_to :recipe

  # setup accessible attributes for comment.
  attr_accessible :content, :rating
end
