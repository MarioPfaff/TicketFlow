class AddRelationsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets do |t|
      t.belongs_to :user, foreign_key: true
    end
  end
end