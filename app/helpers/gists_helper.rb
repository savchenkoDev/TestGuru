module GistsHelper
  def short_body(question_id)
    link_to Question.find(question_id).body[0..24], admin_question_path(question_id)
  end
end
