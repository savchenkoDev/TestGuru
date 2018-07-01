class ChangeColumnDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default :tests, :level, to: 1
    change_column_default :questions, :correct, to: false
  end
end
