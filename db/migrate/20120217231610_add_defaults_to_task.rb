class AddDefaultsToTask < ActiveRecord::Migration
  def change
    change_column_default(:tasks, :input, "")
    change_column_default(:tasks, :output, "")
    change_column_default(:tasks, :expectation, "")
  end
end
