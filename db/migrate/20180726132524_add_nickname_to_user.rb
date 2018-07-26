class AddNicknameToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :nickname, :string
    remove_column :users, :first_name, :string
    remove_column :users, :last_name, :string
  end
end
