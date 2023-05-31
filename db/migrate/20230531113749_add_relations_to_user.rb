class AddRelationsToUser < ActiveRecord::Migration[7.0]
  def change
      add_reference :tickets, :users, foreign_key:true

  end
end
