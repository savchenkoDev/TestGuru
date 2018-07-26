class TestPassagesController < ApplicationController
  before_action :find_test_passage, only: %i[show result update gist gist_params]

  def show; end

  def result; end

  def update
    if @test_passage.empty_answer?(params[:answer_ids])
      return render :show, alert: "You did't select any answers."
    end

    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    @result = GistQuestionService.new.create_gist(@test_passage.current_question)

    if !@result[:html_url].nil?
      @gist = Gist.create!(gist_params)
      # @gist.question_id = @test_passage.current_question.id
      # @gist.user = current_user.email
      # @gist.gist_url = @result[:html_url]
      # @gist.save!
      flash_options = { notice: t('.success', link: @result[:html_url]) }
    else
      flash_options = { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def gist_params
    {
      question_id: @test_passage.current_question.id,
      gist_url: @result[:html_url],
      user: current_user.email
    }
  end

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
