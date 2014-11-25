class Campaign < ActiveRecord::Base
  belongs_to :user
  belongs_to :picture
  has_many :votes
end
