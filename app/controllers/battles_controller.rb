class BattlesController < ApplicationController

  def index
    @gym = Gym.find_by(index: current_user.num_badges + 1)
    @question = Trivium.easy_trivia
  end

  def show
  end

  def new
    @gym = Gym.find_by(index: current_user.num_badges + 1)
    @question = Trivium.easy_trivia
    @battle = Battle.new(
      trainer_id: current_user,
      gym_id: @gym.id,
      current_question_id: @question.id,
      correct_answer_count: 0,
      victory: false
    )
  end

  def create
    @question = Trivium.find(params[:battle][:current_question_id])
    if @question.correct_answer == params[:battle][:answer_submission]
      @gym = Gym.find_by(index: current_user.num_badges + 1)
      @battle = Battle.new(
        trainer_id: current_user.id,
        gym_id: @gym.id,
        correct_answer_count: 0,
        victory: true
      )
      @battle.save
      @trainer = Trainer.find(current_user.id)
      new_count = @trainer.num_badges + 1
      @trainer.update(num_badges: new_count)
      redirect_to trainer_path(current_user)
    else
      redirect_to trainer_path(current_user)
    end
  end

  def edit
  end

  def update
    @battle = Battle.find(params[:battle][:incorrect_answer_count])
    @gym = Gym.find(@battle.gym_id)
    @question = Trivium.find(@battle.current_question_id)
    if params[:battle][:answer_submission] == @question.correct_answer && (@battle.correct_answer_count - 1) == @gym.number_of_questions
      @battle = Battle.update(
        trainer_id: current_user,
        gym_id: @gym.id,
        current_question_id: @question.id,
        correct_answer_count: 1,
        victory: true
      )
      redirect_to battle_path(@battle)
    elsif params[:battle][:answer_submission] == @question.correct_answer
      new_count = @battle.correct_answer_count + 1
      @question = Trivium.easy_trivia
      @battle = Battle.update(
        trainer_id: current_user,
        gym_id: @gym.id,
        current_question_id: @question.id,
        correct_answer_count: new_count,
        victory: false
      )
      render :edit
    else
      @question = Trivium.easy_trivia
      @battle = Battle.update(
        trainer_id: current_user,
        gym_id: @gym.id,
        current_question_id: @question.id,
        victory: false
      )
      render :edit
    end
  end
end
