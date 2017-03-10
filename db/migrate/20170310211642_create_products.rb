class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.text :body_html
      t.timestamps :created_at
      t.integer :pid
      t.string :tags
      t.string :title
      t.string :vendor

      t.timestamps
    end
  end
end
