class UserMailer < ApplicationMailer
  def new_user_email(user)
    @user = user
    mail subject: "Gracias por registrarte en Organiza2, #{user.full_name}", to: user.email
   end
end
