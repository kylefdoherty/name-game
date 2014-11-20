class QuestionGroup < ActiveRecord::Base
  belongs_to :game
  has_many :questions
end
