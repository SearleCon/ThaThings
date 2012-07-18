class CreateThings < ActiveRecord::Migration
  def change
    create_table :things do |t|
      t.string :short_name
      t.text :long_name
      t.integer :type_id
      t.string :thing_parent_id

      t.timestamps
    end
  end
end
