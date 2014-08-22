class Entry < ActiveRecord::Base

  validates :name, :presence => true
  validates :description, :presence => true

  has_and_belongs_to_many :tags
  has_many :ratings

  def add_tag(stuff)
    self.tags.destroy_all
    if stuff['entries_tags'] != nil
      ids = stuff['entries_tags'].values.map! { |i| i.to_i }
      ids.each do |id|
        self.tags << Tag.find(id)
      end
    end
  end

  def average_rating
    rate_arr = Rating.where(entry_id: self.id)
    total = 0.0
    rate_arr.each do |rate|
      total +=rate.stars
    end
    if total>0
      average = total / rate_arr.length
      average.round(2)
    else
      "No user ratings"
    end
  end

  def total_ratings
    Rating.where(entry_id: self.id).count
  end

  def self.smart_sort
    Entry.all.sort_by {|a| a.average_rating.to_i + (50000 / (Time.now - a.updated_at)) }.reverse
  end

end
