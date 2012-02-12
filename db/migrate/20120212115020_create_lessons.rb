class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :title
      t.string :description
      t.integer :points
      t.integer :language_id

      t.timestamps
    end
  end
end
