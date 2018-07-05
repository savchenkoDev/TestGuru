class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :author_tests, class_name: 'Test', foreign_key: "author_id"

  validates :username, presence: true

  def find_by_level(level)
    Test.joins(:tests_users).where(
      level: level,
      tests_users: { user_id: id }
    )
  end
end
