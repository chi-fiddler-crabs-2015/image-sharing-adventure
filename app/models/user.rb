class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  validates :password_hash, presence: true

  has_many :albums
  has_many :images, through: :albums


  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    if user && user.password == password
      user
    else
      nil
    end
  end

end
