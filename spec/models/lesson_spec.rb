require 'spec_helper'

describe Lesson do
  it { should belong_to :language }
  it { should validate_presence_of :language}
  it { Factory(:lesson).should validate_uniqueness_of :topic }
  it { should validate_presence_of :topic }
  it { should validate_presence_of :body }
end
