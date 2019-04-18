class GymsController < ApplicationController
  def index
    gym = Trainer.find(current_user.id).num_badges + 1
    @gym = Gym.where(index: gym)
  end

  def show
    @gym = Gym.find(params[:id])
  end

end
