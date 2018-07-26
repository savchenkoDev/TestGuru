class Gist < ApplicationRecord
  validates :question_id, :gist_url, :user, presence: true
end
