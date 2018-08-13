class BadgeService
  def initialize(test_passage)
    user = test_passage.user
    @badges = Badge.all.select { |b| b.tests.include?(test_passage.test) }
    @tests = []
    TestPassage.all.map do |t|
      @tests.push(t.test) if t.user == user && t.success?
    end
    issue(user)
  end

  def issue(user)
    @new_badges = @badges.select do |b|
      b.tests.each { |test| return false unless @tests.include?(test) }
    end
    @new_badges.reject! { |badge| badge.user.include?(user) }
    @new_badges.each { |b| b.user.push(user) }
  end
end
