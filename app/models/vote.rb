class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :campaign
  belongs_to :picture

  validates :campaign, :uniqueness => {:scope => [:user]}
end
