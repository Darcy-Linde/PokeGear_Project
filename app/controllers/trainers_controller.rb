class TrainersController < ApplicationController
  # before_action :require_login
  # skip_before_action :require_login, only: [:new]

  def index
    @trainers = Trainer.all
  end

  def new
    @trainer = Trainer.new
  end

  def create
    @trainer = Trainer.new(trainer_params)
    if @trainer.profile_img == "Brendan"
      @trainer.profile_img = "https://archives.bulbagarden.net/media/upload/e/e6/Spr_E_Brendan.png"
    elsif @trainer.profile_img == "May"
      @trainer.profile_img = "https://archives.bulbagarden.net/media/upload/a/a4/Spr_E_May.png"
    elsif @trainer.profile_img == "Birch"
      @trainer.profile_img = "https://archives.bulbagarden.net/media/upload/7/75/Spr_RS_Birch.png"
    end
    @trainer.num_badges = 0
    if @trainer.save
      redirect_to login_path
    else
      render :new
    end
  end

  def edit
    @trainer = Trainer.find(params[:id])
  end

  def update
    @trainer = Trainer.new(params[:id])
    if @trainer.update(trainer_params)
      redirect_to @trainer
    else
      render :edit
    end
  end

  def show
    @trainer = Trainer.find(params[:id])
  end

  def destroy
    @trainer = Trainer.find(params[:id])
    @trainer.destroy
    redirect_to trainers_url
  end

  private

  def trainer_params
    params.require(:trainer).permit(:name, :bio, :profile_img, :password)
  end



  # def require_login
  #   return head(:forbidden) unless session.include? :user_id
  # end

end
