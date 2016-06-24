class Venue < ActiveRecord::Base
  has_many :visits, dependent: :destroy
  has_many :users, through: :visits

  geocoded_by :full_address
  after_validation :geocode #:if => :full_address_changed? #fetches the coordinates

  def self.search(search)
    if search.length > 0
      return where({city: search})
    else
      all
    end
  end


end
