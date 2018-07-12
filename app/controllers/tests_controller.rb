class TestsController < ApplicationController
  before_action :find_test, only: %i[destroy update edit show]

  def index
    @tests = Test.all
  end

  def show; end

  def new
    @test = Test.new
  end

  def create
    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path, notice: "Test #{@test.title} удален."
  end

  private

  def test_params
    params.require(:test).permit(:title, :level)
  end

  def find_test
    @test = Test.find(params[:id])
  end
end
