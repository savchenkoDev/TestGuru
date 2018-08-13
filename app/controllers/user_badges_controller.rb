class UserBadgesController < ApplicationController
  before_action :find_my_badges, omly: :my
  def index
    @badges = Badge.all
  end

  def my; end

  def create; end

  private

  def find_my_badges
    @badges = Badge.all.select { |b| b.user.include?(current_user) }
  end
end
