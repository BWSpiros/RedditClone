class User < ActiveRecord::Base
  attr_accessible :email, :password, :token
  validates :email, :password, presence: true
  validates :password, length: {minimum: 6, before: :initialize}


  def self.find_by_credentials(email, pass)
    @user = User.find_by_email(email)

    return @user if !@user.nil? && @user.is_password?(pass)
    nil
  end

  def password
    @password || self.password_digest
  end

  def password=(pass)
    @password = pass
    self.password_digest = BCrypt::Password.create(pass)
  end

  def is_password?(pass)
    BCrypt::Password.new(self.password_digest).is_password?(pass)
  end

  def reset_token
    self.token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.token
  end


end
