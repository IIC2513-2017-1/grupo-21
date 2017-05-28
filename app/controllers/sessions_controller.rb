class SessionsController < ApplicationController
  before_action :sesion_iniciada, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user&.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to tournaments_path, notice: 'Has iniciado sesión'
    else
      redirect_to(new_session_path, alert: 'Email o contraseña incorrectos')
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'Has salido correctamente'
  end

  private

  def sesion_iniciada
    redirect_to(root_path, notice: 'Ya estás en tu cuenta') if current_user
  end
end
