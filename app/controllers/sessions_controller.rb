class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by_email(params[:email])

    if user &&  params[:password] == user.encrypted_password
      redirect_to "/people"
    else
      redirect_to :new_session, alert: "Wrong username or password"
    end
  end
end