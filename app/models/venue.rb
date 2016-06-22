class Venue < ActiveRecord::Base
  has_many :visits
  has_many :users, through: :visits

  def self.search(search)
    if search.length > 0
      return where({city: search})
    else
      all
    end
  end
end
