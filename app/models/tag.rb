class Tag < ActiveRecord::Base

  has_and_belongs_to_many :entries

  validates :name, :presence => true
  validates :name, :uniqueness => true

  def number_of_entries
    self.entries.count
  end
end
