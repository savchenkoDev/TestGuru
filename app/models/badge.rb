class Badge < ApplicationRecord
  extend Enumerize

  enumerize :category, in: %i[category_badge single_badge level_badge]

  has_many :user_badges
  has_many :user, through: :user_badges
  has_and_belongs_to_many :tests

  scope :for_category, -> { where(category: 'category_badge') }
  scope :for_single, -> { where(category: 'single_badge') }
  scope :for_level, -> { where(category: 'level_badge') }

  validates :title, presence: true
  validates :category, presence: true
  validate :validate_badges_by_category, on: %i[create update]

  def for_test(test)
    answer = []

    single_badge = Badge.find_by([primary_param: test.title, secondary_param: test.level])
    category_badge = Badge.find_by([primary_param: test.category.title])
    level_badge = Badge.find_by([primary_param: test.level])

    answer.push(single_badge) unless single_badge.nil?
    answer.push(category_badge) unless category_badge.nil?
    answer.push(level_badge) unless level_badge.nil?

    answer
  end

  private

  def validate_badges_by_category
    case category
    when 'category_badge'
      errors.add(:primary_param) unless Category.exists?(title: primary_param)
    when 'single_badge'
      errors.add(:primary_param) unless Test.exists?(title: primary_param)
      errors.add(:secondary_param) unless Test.exists?(title: primary_param, level: secondary_param)
    when 'level_badge'
      errors.add(:primary_param) unless Test.exists?(level: primary_param)
    end
  end
end
