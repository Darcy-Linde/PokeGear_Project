class SessionsController < ApplicationController

  def new
  end

  def create
    @trainer = Trainer.find_by(username: params[:username])
    if @trainer && @trainer.authenticate(params[:password])
      session[:user_id] = @trainer.id
      redirect_to root_path
    else
      @error = "Invalid Username or Password"
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

end
