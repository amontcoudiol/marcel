class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :campaign
  belongs_to :picture

  validates :user, :uniqueness => {:scope => [:campaign]}

  after_create :check_amount

  def check_amount
    nb_votes = self.campaign.votes.length
    if nb_votes > 4
      self.campaign.status = false
      self.campaign.save
      user = self.campaign.user
      UserMailer.results(user).deliver
    end
  end

end
