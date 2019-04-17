class SessionsController < ApplicationController

  def new
  end

  def create
    @trainer = Trainer.find_by(name: params[:name])
    if @trainer && @trainer.authenticate(params[:password])
      session[:user_id] = @trainer.id
      redirect_to trainer_path(@trainer)
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
