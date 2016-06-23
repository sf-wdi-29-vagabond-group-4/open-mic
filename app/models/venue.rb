class Venue < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :users, through: :comments
  has_many :visits, dependent: :destroy
  has_many :users, through: :visits

  validates :name, length: {minimum: 1, maximum: 200, message: " Name must be between 1 and 200 characters"}
  validates :street_one,:city,:state,:zipcode,:phone_number,:description , presence: true

  def self.search(search)
    if search.length > 0
      return where({city: search})
    else
      all
    end
  end

end
