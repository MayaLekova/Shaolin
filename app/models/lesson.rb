class Lesson < ActiveRecord::Base
  belongs_to :language
  validates_presence_of :language
end