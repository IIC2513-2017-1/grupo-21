class UserMailer < ApplicationMailer
  def new_user_email(user)
    @user = user
    mail subject: "Gracias por registrarte en Organiza2, #{user.full_name}", to: user.email
   end

   def tournament_email(user, tournament)
     @user = user
     @tournament = tournament
     mail subject: "Has creado un nuevo torneo", to: user.email
   end
end
