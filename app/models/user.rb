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

  validates :email, uniqueness: true, presence: true, format: /.+@.+\..+/i
  validates :first_name, :last_name, presence: true

  def test_passage(test)
    test_passages.order(created_at: :desc).find_by(test: test)
  end

  def admin?
    unless current_user.is_a?(Admin)
      redirect_to root_path, alert: 'You are not authorized to view this page'
    end
  end
end
