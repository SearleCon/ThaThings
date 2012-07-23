class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.integer :rowcountperpage
      t.integer :user_id

      t.timestamps
    end
  end
end
