class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :confirmable,
         :rememberable,
         :trackable,
         :validatable

  has_many :test_passages
  has_many :gists
  has_many :tests, through: :test_passages
  has_many :author_tests, class_name: 'Test', foreign_key: :author_id

  validates :email, uniqueness: true, presence: true, format: /.+@.+\..+/i

  def test_passage(test)
    test_passages.order(created_at: :desc).find_by(test: test)
  end
end
