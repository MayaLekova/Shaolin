require 'spec_helper'

describe Language do
  it "has many lessons" do
    should have_many :lessons
  end

  it "should have a name" do
    should validate_presence_of :name
  end
end
