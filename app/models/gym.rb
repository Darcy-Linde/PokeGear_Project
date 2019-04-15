class Gym < ApplicationRecord
  has_many :battles
  has_many :trainers, through: :battles
end
