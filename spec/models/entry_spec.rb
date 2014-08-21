require 'spec_helper'


describe Entry do
  it {should have_and_belong_to_many(:tags)}
  it {should have_many :ratings}

  describe "add_tag" do
    it "adds a tag to an entry given a hash of tag IDs" do
      test_tag = Tag.create(name: "lunch")
      id = test_tag.id
      test_tag2 = Tag.create(name: "dinner")
      id2 = test_tag2.id
      test_entry = Entry.create(name: "burrito", description: "stuff")
      stuff = {"entry"=>{"name"=>"burrito", "description"=>"stuff"}, "entries_tags"=>{"tag1"=>id.to_s, "tag2"=>id2.to_s}, "controller"=>"entries", "action"=>"create"}
      test_entry.add_tag(stuff)
      expect(test_entry.tags).to eq [test_tag, test_tag2]
    end
  end
end
