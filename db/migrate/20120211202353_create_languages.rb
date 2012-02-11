class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :name
      t.string :description
      t.string :command
      t.string :file_extension
      t.text :wrapping_code

      t.timestamps
    end
  end
end
