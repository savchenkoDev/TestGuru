class BadgeService
  def initialize(test_passage)
    user = test_passage.user
    @badges = Badge.all.select { |b| b.find_tests.include?(test_passage.test) }
    @tests = user.test_passages.select(&:success?).map(&:test)
  end

  def build
    @badges.select do |b|
      b.find_tests.any? { |test| @tests.include?(test) }
    end
    # @new_badges.reject! { |badge| badge.user.include?(user) }
  end
end
