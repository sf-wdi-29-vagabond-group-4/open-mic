class Venue < ActiveRecord::Base
  has_many :visits
  has_many :users, through: :visits
  validates :name, length: {minimum: 1, maximum: 200, message: " is not between 1-200"}
  validates :description , presence: true
  def self.search(search)
    if search.length > 0
      return where({city: search})
    else
      all
    end
  end
end
