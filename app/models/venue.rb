class Venue < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :users, through: :comments
  has_many :visits, dependent: :destroy
  has_many :users, through: :visits


  validates :name, length: {minimum: 1, maximum: 200, message: " Name must be between 1 and 200 characters"}
  validates :street_one,:city,:state,:zipcode, presence: true
  validate :check_phone_number 

  geocoded_by :full_address
  after_validation :geocode #:if => :full_address_changed? #fetches the coordinates


  def self.search(text)
    query = "%#{text}%"
    if text.present?
      return where("name ILIKE :text OR city ILIKE :text", text: query)
    end
  end

  def check_phone_number
    return if self.phone_number.blank?
    unless self.phone_number.gsub(/\D/, "").length == 10
      errors.add(:phone_number, " must be 10 digits")
    end
  end

end
