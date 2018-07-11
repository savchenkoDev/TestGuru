module QuestionsHelper

  def question_header(test, action)
    case action
    when :create then intro = 'Create New'
    when :update then intro = 'Edit'
    end
    "#{intro} #{test.title} Question"
  end

  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    render 'shared/git', author:author, repo:repo
    # "link_to #{author}, #{repo}"
  end
end
