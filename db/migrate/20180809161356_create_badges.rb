class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :cover, default: '../../kubok.png'
      t.string :category, null: false
      t.string :primary_param
      t.string :secondary_param

      t.timestamp
    end
  end
end
