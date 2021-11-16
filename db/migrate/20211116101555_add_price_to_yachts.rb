class AddPriceToYachts < ActiveRecord::Migration[6.0]
  def change
    add_column :yachts, :price, :integer
  end
end
