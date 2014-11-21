class Game < ActiveRecord::Base
  after_save :game_setup
  has_many :question_groups
  has_many :questions, through: :question_groups

  def game_setup
    teammates = Teammate.where(office: office)

    teammates.each do |teammate|
      questions = question_group_questions(teammate)

      question_groups << QuestionGroup.create(image: teammate.image, questions: questions)
    end
  end

  private

    def question_group_questions(teammate)
      [
        Question.new(text: teammate.name, label: "name"),
        Question.new(text: teammate.title, label: "title"),
        Question.new(text: teammate.team, label: "team")
      ]
    end

end

