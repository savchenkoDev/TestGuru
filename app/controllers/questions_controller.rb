class QuestionsController < ApplicationController
  before_action :find_test, only: %i[create]

  # rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found
  def index
    @questions = Question.all
  end

  def show
    @question = find_question
  end

  def new
    @question = Question.new
  end

  def create
    @question = @test.questions.new(question_parameters)

    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def edit
    @question = find_question
  end

  def update
    @question = find_question
    if @question.update(question_parameters)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @question = find_question
    @question.destroy
    redirect_to test_questions_path(params[:test_id])
  end

  private

  def question_parameters
    params.require(:question).permit(:body)
  end

  def find_question
    Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
