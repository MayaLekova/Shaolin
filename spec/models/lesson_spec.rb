require 'spec_helper'

describe Lesson do
  it "belongs to a language" do
    should belong_to :language
    should validate_presence_of :language
  end
end
