class BattlesController < ApplicationController

  def index
    @gym = Gym.find_by(index: current_user.num_badges + 1)
  end

  def show
  end

  def new
    @gym = Gym.find_by(index: current_user.num_badges + 1)
    @question = Trivium.easy_trivia
    @battle = Battle.new
  end

  def create
    @gym = Gym.find_by(index: current_user.num_badges + 1)
    @battle = Battle.new(
      trainer_id: current_user,
      gym_id: @gym.id,
      
    )
  end

  def edit
  end

  def update
  end
end
