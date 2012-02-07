class Language < ActiveRecord::Base
  has_many :lessons
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :execution_command_format
end
