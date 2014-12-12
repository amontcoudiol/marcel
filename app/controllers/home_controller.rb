require "invitation_request"

class HomeController < ApplicationController
 skip_before_action :authenticate_user!

 def index
 end

 def policy
 end

 def beer
 end

 def invitationrequest
    begin
      InvitationRequest.new.run(params[:email])

      flash[:notice] = "You successfully subscribed to the Newsletter!"
    rescue Gibbon::MailChimpError => e
      flash[:alert] = e.message
    end
    redirect_to root_path
  end

end