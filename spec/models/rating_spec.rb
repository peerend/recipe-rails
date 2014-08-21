require 'spec_helper'


describe Rating do
  it {should belong_to (:entry)}
  it { should validate_numericality_of(:rating).only_integer }
end
