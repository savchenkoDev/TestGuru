class CreateUserTests < ActiveRecord::Migration[5.2]
  def change
    create_table :user_tests do |t|
      t.integer :user_id
      t.integer :test_id
      t.integer :result

      t.timestamps
    end

    add_foreign_key :user_tests, :tests
    add_foreign_key :user_tests, :users
  end
end
