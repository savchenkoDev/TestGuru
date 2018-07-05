class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validate :validate_answer_count

  private

  def validate_answer_count
    errors.add(:question_id) if Answer.where(question_id: question_id).size > 3
  end
end
