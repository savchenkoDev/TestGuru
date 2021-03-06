module TestPassagesHelper
  def result_style(test_passage)
    test_passage.success? ? 'bg-success' : 'bg-danger'
  end

  def question_count(test_passage)
    "#{test_passage.question_number} of #{test_passage.test.questions.size}"
  end
end
