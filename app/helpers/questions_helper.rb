module QuestionsHelper

  def question_header(question)
    intro = question.new_record? ? 'Create New' : 'Edit'
    "#{intro} #{question.test.title} Question"
  end

  def current_year
    Time.current.year
  end

  def github_link(author, repo)
    link_to 'GitHub', "https://github.com/#{author}/#{repo}", target: '_blank'
  end
end
