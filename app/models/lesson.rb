class Lesson < ActiveRecord::Base
  belongs_to :language
  validates_presence_of :language
  
  has_many :paragraphs
  has_many :tasks

  def components
    (paragraphs + tasks).sort { |component1, component2| component1.position <=> component2.position }
  end

end
