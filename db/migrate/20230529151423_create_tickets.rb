class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :content
      t.string :label
      t.integer :status

      t.timestamps
    end
  end
end
