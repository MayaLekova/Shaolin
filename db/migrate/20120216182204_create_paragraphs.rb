class CreateParagraphs < ActiveRecord::Migration
  def change
    create_table :paragraphs do |t|
      t.integer :position
      t.text :body
      t.references :lesson

      t.timestamps
    end
    
    add_index :paragraphs, :lesson_id
  end
end
