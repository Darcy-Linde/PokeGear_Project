class SessionsController < ApplicationController
  def new
<<<<<<< HEAD
    @top_three = Trainer.order(num_badges: :desc).limit(5)
=======
    @sorted = Trainer.order(num_badges: :desc).limit(4)

>>>>>>> f1d5757ad77fb3d9f89929b61c71854e18b651f4
  end

  def create
    # new
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
