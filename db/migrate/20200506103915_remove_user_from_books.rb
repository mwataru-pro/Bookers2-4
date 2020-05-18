class RemoveUserFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :user, :string
  end
end
