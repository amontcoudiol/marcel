class Picture < ActiveRecord::Base
  has_many :campaigns
  has_many :votes
end
