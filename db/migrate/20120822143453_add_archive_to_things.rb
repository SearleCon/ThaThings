class AddArchiveToThings < ActiveRecord::Migration
  def change
    add_column :things, :archive, :boolean
  end
end
