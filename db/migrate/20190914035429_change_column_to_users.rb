class ChangeColumnToUsers < ActiveRecord::Migration[5.2]
  def change
  end

  def up
      change_column :users, :email, :string, null: true, default: ""
  end

end
