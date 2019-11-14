class CreateConcerts < ActiveRecord::Migration[6.0]
  def change
    create_table :concerts do |t|
      t.string :band
      t.string :date
      t.string :venue
      t.string :address
      t.string :price
    end
  end
end
