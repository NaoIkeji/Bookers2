class RmoveNameFromBooks < ActiveRecord::Migration[5.2]
  def change
  	remove_column :books, :name
  end
end
