class Tag < ActiveRecord::Base

  has_many :entries
  belongs_to :entry

  validates :name, :presence => true

end
