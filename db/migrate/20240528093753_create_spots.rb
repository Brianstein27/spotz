class CreateSpots < ActiveRecord::Migration[7.1]
  def change
    create_table :spots do |t|
      t.string :name
      t.string :address
      t.string :category
      t.string :subtitle
      t.text :description

      t.timestamps
    end
  end
end
