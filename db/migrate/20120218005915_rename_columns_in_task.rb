class RenameColumnsInTask < ActiveRecord::Migration
  def change
    change_table :tasks do |t|
      t.rename :output, :expected
      t.rename :input, :initial_code
      t.rename :expectation, :hint
    end
  end
end
