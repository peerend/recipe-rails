class Entry < ActiveRecord::Base

  has_and_belongs_to_many :tags
  has_many :ratings

end
