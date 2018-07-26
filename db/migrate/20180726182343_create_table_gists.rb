class CreateTableGists < ActiveRecord::Migration[5.2]
  def change
    create_table :gists do |t|
      t.integer :question_id
      t.string :gist_url
      t.string :user
    end
  end
end
