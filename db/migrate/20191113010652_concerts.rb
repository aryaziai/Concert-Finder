class Concerts < ActiveRecord::Migration[6.0]
  def change
    create_table :concerts do |t|
      t.string :bands
      t.datetime :date
      t.string :venue
      t.string :address
      t.integer :price
    end
  end
end
