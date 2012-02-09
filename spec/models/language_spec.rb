require 'spec_helper'

describe Language do
  it { should have_many :lessons }
  it { Factory(:language).should validate_uniqueness_of :name }
  it { should validate_presence_of :name }
  it { should validate_presence_of :execution_command_format }
end
