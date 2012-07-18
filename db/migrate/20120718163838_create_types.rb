class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.string :type_name
      t.string :short_label
      t.string :long_lebel

      t.timestamps
    end
  end
end
