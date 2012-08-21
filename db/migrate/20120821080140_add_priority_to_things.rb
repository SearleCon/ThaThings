class AddPriorityToThings < ActiveRecord::Migration
  def change
    add_column :things, :priority, :integer

  end
end
