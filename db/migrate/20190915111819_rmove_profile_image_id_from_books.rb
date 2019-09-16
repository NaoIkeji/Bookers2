class RmoveProfileImageIdFromBooks < ActiveRecord::Migration[5.2]
  def change
  	remove_column :books ,:profile_image
  end
end
