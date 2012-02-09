require 'spec_helper'

describe Lesson do
  it { should belong_to :language }
  it { should validate_presence_of :language}
end
