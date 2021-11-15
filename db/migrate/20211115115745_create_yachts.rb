class CreateYachts < ActiveRecord::Migration[6.0]
  def change
    create_table :yachts do |t|
      t.string :name
      t.text :description
      t.integer :capacity
      t.string :location

      t.timestamps
    end
  end
end
