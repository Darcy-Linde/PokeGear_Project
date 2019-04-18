class Trivium < ApplicationRecord
  def self.easy_trivia
    # question_pool = self.where(difficulty: "easy")
    first_id = self.first.id
    rand_easy_index = rand(first_id..(first_id + 24))
    self.find(rand_easy_index)
  end

  def self.medium_trivia
    first_id = self.first.id
    rand_medium_index = rand((first_id + 25)..(first_id + 49))
    self.find(rand_medium_index)
  end

  def self.hard_trivia
    first_id = self.first.id
    rand_hard_index = rand((first_id + 50)..(first_id + 64))
    self.find(rand_hard_index)
  end

  def randomized_array
    a = self.correct_answer
    b = self.incorrect_answer_1
    c = self.incorrect_answer_2
    d = self.incorrect_answer_3
    new_array = [a,b,c,d].shuffle
  end
end
