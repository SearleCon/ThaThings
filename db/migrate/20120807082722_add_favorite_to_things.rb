class AddFavoriteToThings < ActiveRecord::Migration
  def change
    add_column :things, :favorite, :boolean, default: false
  end
end