class TrainersController < ApplicationController
  def index
    @trainers = Trainer.all
  end

  def new
    @trainer = Trainer.new
  end

  def create
    @trainer = Trainer.new(trainer_params)
    @trainer.profile_img = "https://archives.bulbagarden.net/media/upload/e/e8/Spr_HGSS_Red.png"
    @trainer.num_badges = 8
    if @trainer.save
      redirect_to @trainer
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
    params.require(:trainer).permit(:name, :bio, :profile_img)
  end

end
