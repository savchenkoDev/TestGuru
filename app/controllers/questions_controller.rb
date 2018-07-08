class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show]
  before_action :find_test, only: %i[create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found
  def index
    render json: { questions: Question.where(test_id: params[:test_id]) }
  end

  def show
    render 'show'
  end

  def new; end

  def create
    @test.questions.create(params.require(:question).permit(:body))
    render html: '<h3><center>Question create</center></h3>'.html_safe
  end

  def destroy
    Question.find(params[:id]).destroy
    redirect_to test_questions_path
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
