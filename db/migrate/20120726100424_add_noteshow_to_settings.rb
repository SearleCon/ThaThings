class AddNoteshowToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :show_notes, :boolean

  end
end
