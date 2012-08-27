class AddTargetDateToThings < ActiveRecord::Migration
  def change
    add_column :things, :target_date, :datetime

  end
end
