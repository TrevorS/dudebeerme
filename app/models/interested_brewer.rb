# == Schema Information
#
# Table name: interested_brewers
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class InterestedBrewer < ActiveRecord::Base
  attr_accessible :email

  before_save { self.email.downcase! }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
end
