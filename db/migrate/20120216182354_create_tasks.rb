class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :position
      t.text :input
      t.text :output
      t.text :expectation
      t.references :lesson

      t.timestamps
    end
    
    add_index :tasks, :lesson_id
  end
end
