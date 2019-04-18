class GymsController < ApplicationController
  def index
    # gym = Trainer.find(current_user.id).num_badges + 1
    # @gym = Gym.find_by(index: current_user.num_badges + 1)
    # @question = Trivium.easy_trivia
  end

  def show
    @gym = Gym.find(params[:id])
  end

end
