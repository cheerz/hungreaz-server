class AddSexeToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :sexe, :string
  end
end
