class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.integer :customer_id
      t.integer :concert_id
    end
  end
end
