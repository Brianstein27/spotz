class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :address
      t.date :date
      t.time :time
      t.string :image_url

      t.timestamps
    end
  end
end
