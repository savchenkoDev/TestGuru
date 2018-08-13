class Admin::BadgesController < Admin::BaseController
  before_action :find_badge, only: %i[show edit update destroy find_tests]
  before_action :find_tests, only: %i[create update]
  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      @badge.tests.push(@tests)
      redirect_to admin_badge_path(@badge)
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @badge.update(badge_params)
      @badge.tests.push(@tests)
      redirect_to admin_badge_path(@badge)
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path, notice: "Бэйдж #{@badge.title} удален."
  end

  private

  def badge_params
    params[:badge].permit(:title, :category, :cover, :primary_param, :secondary_param)
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def find_tests
    @tests = case params[:badge][:category]
             when 'category_badge'
               category = Category.find_by(title: params[:badge][:primary_param])
               Test.all.where(category_id: category)
             when 'single_badge'
               Test.find_by(title: params[:badge][:primary_param], level: params[:badge][:secondary_param])
             when 'level_badge'
               Test.find_by(level: params[:badge][:primary_param])
             end
  end
end
