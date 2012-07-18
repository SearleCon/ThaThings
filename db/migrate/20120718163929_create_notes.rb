class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :note_text
      t.integer :thing_id

      t.timestamps
    end
  end
end
