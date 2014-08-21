require 'spec_helper'


describe Entry do
  it {should have_and_belong_to_many(:tags)}
  it {should have_many :ratings}
end
