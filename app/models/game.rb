class Game < ActiveRecord::Base
  has_many :question_groups
  has_many :questions, through: :question_groups
end
