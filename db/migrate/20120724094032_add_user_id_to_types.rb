class AddUserIdToTypes < ActiveRecord::Migration
  def change
    add_column :types, :user_id, :integer

  end
end
