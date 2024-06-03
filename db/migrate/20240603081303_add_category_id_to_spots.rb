class AddCategoryIdToSpots < ActiveRecord::Migration[7.1]
  def change
    add_reference :spots, :category, foreign_key: true
  end
end
