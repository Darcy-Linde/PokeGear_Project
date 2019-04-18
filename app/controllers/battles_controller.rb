class BattlesController < ApplicationController
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
