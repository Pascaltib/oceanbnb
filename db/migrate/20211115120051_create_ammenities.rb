class CreateAmmenities < ActiveRecord::Migration[6.0]
  def change
    create_table :ammenities do |t|
      t.boolean :wifi
      t.boolean :restaurant
      t.boolean :pool
      t.boolean :inflatable_slide
      t.boolean :jacuzzi
      t.references :yacht, null: false, foreign_key: true

      t.timestamps
    end
  end
end
