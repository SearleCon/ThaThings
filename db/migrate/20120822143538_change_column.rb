class ChangeColumn < ActiveRecord::Migration
  def up
    change_column :things, :archive, :boolean, :default => false
  end

  def down
    change_column :things, :archive, :boolean, :default => nil
  end
end
