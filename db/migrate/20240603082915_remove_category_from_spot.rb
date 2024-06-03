class RemoveCategoryFromSpot < ActiveRecord::Migration[7.1]
  def change
    remove_column :spots, :category, :string
  end
end
