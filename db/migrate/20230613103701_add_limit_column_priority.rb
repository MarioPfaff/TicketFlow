class AddLimitColumnPriority < ActiveRecord::Migration[7.0]
  def change
    change_column :tickets, :priority, :integer, default: 0, limit: 3
    change_column :tickets, :status, :integer, default: 0, limit: 3
    change_column :tickets, :label, :string, limit: 20, default: 'Niet gecategoriseerd'
  end
end
