class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
 def facebook
   user = User.find_for_facebook_oauth(request.env["omniauth.auth"])

   if user.persisted?
     sign_in_and_redirect user, event: :authentication
     set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
   else
     session["devise.facebook_data"] = request.env["omniauth.auth"]
     redirect_to root_path
     set_flash_message(:notice, :failure, :kind => "Facebook", :reason => "Tinder Genius requires access to your pictures (to test them!), your birth date (to decide which pictures you're going to vote on) and your email address (to let you know when you're results are ready)! Please allow access to this information to use Tinder Genius.") if is_navigational_format?
   end
 end
end



   # if user.persisted?
   #   sign_in user
   #   redirect_to next_votes_path
   #   set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?