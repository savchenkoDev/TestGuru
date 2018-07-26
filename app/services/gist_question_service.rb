class GistQuestionService
  def initialize(client: nil)
    @client = client || Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end

  def create_gist(question)
    @question = question
    @test = @question.test
    @client.create_gist(gist_params)
  end

  def get_all_gists(username)
    @client.list_gists(username)
  end

  private

  def gist_params
    {
      description: I18n.t('.gist_header', title: @test.title),
      public: false,
      files: {
        'text-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
