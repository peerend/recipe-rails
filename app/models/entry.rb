class Entry < ActiveRecord::Base

  validates :name, :presence => true
  validates :description, :presence => true

  has_and_belongs_to_many :tags
  has_many :ratings

  def add_tag(stuff)
    self.tags.destroy_all
    ids = stuff['entries_tags'].values.map! { |i| i.to_i }
    ids.each do |id|
      self.tags << Tag.find(id)
    end
  end

  def average_rating
    rate_arr = Rating.where(entry_id: self.id)
    total =0.0
    rate_arr.each do |rate|
      total +=rate.stars
    end
    if total>0
      average = total / rate_arr.length
    else
      "No user ratings"
    end
  end

  def total_ratings
    Rating.where(entry_id: self.id).count
  end
end
