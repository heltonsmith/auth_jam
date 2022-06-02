class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logeado correctamente :D"
    else
      redirect_to new_session_path, notice: "No existe la cuenta! XD"
    end
  end

  def destroy
    session[:user_id] = nil 
    redirect_to new_session_path, notice: "Adios!... Ha cerrado la sesión :("
  end
end
