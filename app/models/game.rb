class Game < ActiveRecord::Base
  has_many :question_groups
  has_many :questions, through: :question_groups

  def game_setup
    teammates = Teammate.where(office: office)

    teammates.each do |t|
      questions = [Question.new(text: t.name), Question.new(text: t.title), Question.new(text: t.team)]


      question_groups << QuestionGroup.create(image: t.image, questions: questions)
    end
  end

end

