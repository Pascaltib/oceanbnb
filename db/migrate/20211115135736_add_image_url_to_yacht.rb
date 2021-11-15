class AddImageUrlToYacht < ActiveRecord::Migration[6.0]
  def change
    add_column :yachts, :image_url, :text
  end
end
