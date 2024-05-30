class AddImageUrlToSpot < ActiveRecord::Migration[7.1]
  def change
    add_column :spots, :img_url, :string
  end
end
