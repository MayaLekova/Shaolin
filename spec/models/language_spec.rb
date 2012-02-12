require 'spec_helper'

describe Language do
  it "has many lessons" do
    should have_many :lessons
  end
end
