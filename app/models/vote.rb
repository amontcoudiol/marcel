class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :campaign
  belongs_to :picture

  validates :user, :uniqueness => {:scope => [:campaign]}
end
