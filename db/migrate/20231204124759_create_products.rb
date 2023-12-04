class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.text :title
      t.integer :price
      t.string :category
      t.string :image

      t.timestamps
    end
  end
end
