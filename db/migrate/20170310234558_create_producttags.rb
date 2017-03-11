class CreateProducttags < ActiveRecord::Migration[5.0]
  def change
    create_table :producttags do |t|
      t.integer :product_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
