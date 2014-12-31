require "invitation_request"

class HomeController < ApplicationController
 skip_before_action :authenticate_user!
 # protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
 # protect_from_forgery with: :null_session

 def index
 end

 def policy
 end

 def beer
 end

 def subscribe
    begin
      InvitationRequest.new.run(params[:email])
      puts "email success"
      # flash[:notice] = "Thank you! We'll get in touch soon."
    rescue Gibbon::MailChimpError => e
      puts "email failure"
      # flash[:alert] = "Sorry there was a problem"
      # flash[:alert] = e.message
    end
    redirect_to root_path
  end

end