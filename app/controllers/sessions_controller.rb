class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:create, :new]

  def new
    if @_current_user
      redirect_to :people
    end
  end

  def create
    user = User.find_by_email(params[:email])

    if user &&  params[:password] == user.encrypted_password
      session[:current_user_id] = user.id
      redirect_to "/people"
    else
      redirect_to :new_session, alert: "Wrong username or password"
    end
  end

  
end