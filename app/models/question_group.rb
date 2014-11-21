class QuestionGroup < ActiveRecord::Base
  belongs_to :game
  has_many :questions
  accepts_nested_attributes_for :questions
end
