class Tickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.integer :seat
      t.integer :customer_id
      t.integer :concert_id
    end
  end
end
