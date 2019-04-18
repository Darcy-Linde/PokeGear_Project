class BattlesController < ApplicationController

  def index
    @gym = Gym.find_by(index: current_user.num_badges + 1)
  end

  def show
  end

  def new
    @gym = Gym.find_by(index: current_user.num_badges + 1)
    @question = Trivium.easy_trivia
  end

  def create
  end

  def edit
  end

  def update
  end
end
