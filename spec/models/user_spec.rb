require 'spec_helper'

describe User do
  it "validates presence of password" do
    should validate_presence_of :password
  end
end
