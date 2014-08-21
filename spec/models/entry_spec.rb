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

  describe "average_rating" do
    it "averages the user inputted ratings" do
      test_entry = Entry.create(name: "burrito", description: "stuff")
      test_rating = Rating.create(stars: 4, entry_id: test_entry.id)
      test2_rating = Rating.create(stars: 5, entry_id: test_entry.id)
      expect(test_entry.average_rating).to eq 4.5
    end
  end
  describe "total_ratings" do
    it "averages the user inputted ratings" do
      test_entry = Entry.create(name: "burrito", description: "stuff")
      test_rating = Rating.create(stars: 3, entry_id: test_entry.id)
      test2_rating = Rating.create(stars: 5, entry_id: test_entry.id)
      expect(test_entry.total_ratings).to eq 2
    end
  end
end
