class Lesson < ActiveRecord::Base
  belongs_to :language
  validates_presence_of :language
  
  has_many :paragraphs
  has_many :tasks
end
