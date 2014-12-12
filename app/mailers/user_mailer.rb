class UserMailer < ActionMailer::Base
  default from: "yourresults@tindergenius.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.results.subject
  #

  def results(user)
    @user = user # Instance variable => available in view
    mail(to: @user.email, subject: "#{@user.first_name}: Get Your Results!")
    # This will render a view in `app/views/user_mailer`!
  end

end
