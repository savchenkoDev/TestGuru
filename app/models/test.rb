class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users
  belongs_to :author, class_name: 'User'

  scope :find_easy, -> { where(level: 0..1) }
  scope :find_normal, -> { where(level: 2..4) }
  scope :find_hard, -> { where(level: 5..Float::INFINITY) }
  scope :find_by_category, ->(category) {
    joins(:category)
      .where(categories: { title: category })
      .order(title: :desc)
      .pluck(:title)
  }

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than: -1 }
  validates :title, uniqueness: { scope: :level }

  # def self.find_by_category(category)
  #   joins(:category)
  #     .where(categories: { title: category })
  #     .order(title: :desc)
  #     .pluck(:title)
  # end
end
