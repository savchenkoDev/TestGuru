class TestPassage < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_question

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def completed?
    current_question.nil?
  end

  def empty_answer?(answer_ids)
    answer_ids.nil?
  end

  def result_to_percent
    correct_questions.to_f / test.questions.count * 100
  end

  def result_style
    result_to_percent >= 85 ? 'success' : 'fail'
  end

  def question_number
    "#{test.questions.index(current_question) + 1} of
    #{test.questions.size}"
  end

  private

  def before_validation_set_question
    return self.current_question = test.questions.first if new_record?
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
