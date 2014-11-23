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

  def question_stats(label)
    total_questions = total_questions_with_label
    correct_questions = number_of_correct_questions(label)

    ((correct_questions.size.to_f / total_questions.to_f).round(4) * 100 )
  end 

  def game_total_stats
    total_questions = self.question_groups.size * self.question_groups.first.questions.size
    total_correct = number_of_correct_questions(nil)

    ((total_correct.size.to_f / total_questions.to_f).round(4) * 100)
  end 

  private

    def question_group_questions(teammate)
      [
        Question.new(text: teammate.name, label: "name"),
        Question.new(text: teammate.title, label: "title"),
        Question.new(text: teammate.team, label: "team")
      ]
    end

    def total_questions_with_label
      self.question_groups.size 
    end

    def number_of_correct_questions(label = nil)
      if label == nil 
        self.questions.select { |q| q.correct == true }
      else 
        self.questions.select { |q| q.label == label && q.correct == true }
      end 
    end  

end

