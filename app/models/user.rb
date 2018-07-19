class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :confirmable,
         :rememberable,
         :trackable,
         :validatable

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :author_tests, class_name: 'Test', foreign_key: :author_id

  validates :email, uniqueness: true
  validates :email, presence: true, format: /.+@.+\..+/i
  validates :first_name, presence: true
  validates :last_name, presence: true

  def test_passage(test)
    test_passages.order(created_at: :desc).find_by(test: test)
  end
end
