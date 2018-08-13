class CreateJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :badges, :tests do |t|
      t.index :badge_id
      t.index :test_id
    end
  end
end
