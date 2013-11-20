class User < ActiveRecord::Base
  attr_accessible :email, :password
  validates :email, :password, presence: true
  validates :password, length: {minimum: 6, before: :create}


  def self.find_by_credentials(email, pass)
    @user = User.find_by_email
    return @user if @user.is_password?(pass)
    nil
  end

  def password
    @password
  end

  def password=(pass)
    @password = pass
    self.password_digest = BCrypt::Password.create(pass)
  end

  def is_password?(pass)
    BCrypt::Password.new(self.password_digest).is_password?(pass)
  end



end
