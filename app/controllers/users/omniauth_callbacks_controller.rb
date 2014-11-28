class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
 def facebook
   user = User.find_for_facebook_oauth(request.env["omniauth.auth"])

   if user.persisted?
     sign_in_and_redirect user, event: :authentication
     set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
   else
     session["devise.facebook_data"] = request.env["omniauth.auth"]
     redirect_to root_path
     set_flash_message(:notice, :failure, :kind => "Facebook", :reason => "information from Facebook is missing.") if is_navigational_format?
   end
 end
end