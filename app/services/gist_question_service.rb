class GistQuestionService
  def initialize(client: nil)
    @client = client || Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end

  def create_gist(question)
    @question = question
    @test = @question.test
    @client.create_gist(gist_params)
  end

  private

  def gist_params
    {
      description: I18n.t('services.gist_header', title: @test.title),
      public: false,
      files: {
        'text-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end
end
