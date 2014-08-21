require 'spec_helper'


describe Tag do
  it {should have_and_belong_to_many(:entries)}
  it {should validate_presence_of :name}

  describe "number_of_entries" do
    it "returns the number of recipes with that tag" do
      test_tag = Tag.create(name: "yummy")
      test_entry1 = Entry.create(name: "burrito", description: "stuff")
      test_entry2 = Entry.create(name: "taco", description: "stuff")
      test_entry3 = Entry.create(name: "enchiladas", description: "stuff")
      test_entry1.tags << test_tag
      test_entry2.tags << test_tag
      test_entry3.tags << test_tag
      expect(test_tag.number_of_entries).to eq 3
    end
  end
end
