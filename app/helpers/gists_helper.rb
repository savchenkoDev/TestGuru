module GistsHelper
  def gist_link(question)
    link_to truncate(question.body, length: 25), admin_question_path(question.id)
  end
end
