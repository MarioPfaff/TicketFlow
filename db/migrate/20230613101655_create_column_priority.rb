class CreateColumnPriority < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :priority, :integer, default: 0, limit: 4
  end
end
