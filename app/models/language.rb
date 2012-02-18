class Language < ActiveRecord::Base
  has_many :lessons
  validates_presence_of :name, :command, :file_extension
  validates_format_of :command, :with => /%{source_file}/
  validates_format_of :wrapping_code, :with => /%{user_input}/
end
