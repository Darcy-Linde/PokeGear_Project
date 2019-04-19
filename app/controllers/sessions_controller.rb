class SessionsController < ApplicationController

  def new
    @sorted = Trainer.order(num_badges: :desc).limit(3)

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
    redirect_to login_path
  end


end
