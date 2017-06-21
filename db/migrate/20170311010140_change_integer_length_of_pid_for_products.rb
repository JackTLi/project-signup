class ChangeIntegerLengthOfPidForProducts < ActiveRecord::Migration[5.0]
  def change
  	change_column :products, :pid, :integer, limit: 8
  	add_column :products, :vid, :integer, limit: 8
  end
end
