class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :title
      t.text :description
      t.integer :points
      t.integer :language_id
      t.integer :number

      t.timestamps
    end
  end
end
