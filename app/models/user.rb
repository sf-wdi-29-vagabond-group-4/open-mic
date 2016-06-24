class User < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :venues, through: :comments
  has_many :visits, dependent: :destroy
  has_many :venues, through: :visits
  
  validates :first_name, :last_name, :description, :age, :email, :current_city, :password, presence: true
  validates :email, uniqueness: true, confirmation: true
  validates :password, confirmation:true

  has_secure_password
  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end

end
