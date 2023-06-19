class AddingColumnsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string, limit: 50
    add_column :users, :surname_prefix, :string, limit: 10
    add_column :users, :last_name, :string, limit: 50
  end
end
