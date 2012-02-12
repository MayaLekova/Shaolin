class Language < ActiveRecord::Base
  has_many :lessons
  validates_presence_of :name
end
