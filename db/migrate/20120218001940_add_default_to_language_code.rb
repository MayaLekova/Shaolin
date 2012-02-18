class AddDefaultToLanguageCode < ActiveRecord::Migration
  def change
    change_column_default(:languages, :wrapping_code, "%{user_input}")
  end
end
