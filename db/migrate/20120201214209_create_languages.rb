class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :name
      t.text :description
      t.string :execution_command_format
      t.string :source_file_extension
      t.text :wrapping_code

      t.timestamps
    end
  end
end
