class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :author_tests, class_name: 'Test', foreign_key: :author_id

  validates :username, presence: true

  def find_by_level(level)
    Test.joins(:tests_passages).where(
      level: level,
      tests_users: { user_id: id }
    )
  end

  def test_passage(test)
    test_passages.order(created_at: :desc).find_by(test_id: test.id)
  end
end
