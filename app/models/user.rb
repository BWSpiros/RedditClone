class User < ActiveRecord::Base
  attr_accessible :email, :password, :token
  attr_accessor :reset_password_token, :password_reset_sent_at
  validates :email, :password, presence: true
  validates :password, length: {minimum: 6, before: :initialize}

  has_many(:owned_subs,
  class_name: "Sub",
  foreign_key: :user_id,
  primary_key: :id
  )


  has_many(:member_links,
  class_name: "MemberTable",
  foreign_key: :user_id,
  primary_key: :id
  )

  has_many(:mod_links,
  class_name: "ModeratorTable",
  foreign_key: :user_id,
  primary_key: :id
  )

  has_many :subs, through: :member_links, source: :sub
  has_many :modded_subs, through: :mod_links, source: :sub


  def send_password_reset_token
    self.reset_password_token = generate_token
    self.password_reset_sent_at = Time.now
    self.save!

    UserMailer.password_reset(self).deliver!
  end

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

  def generate_token(n = 16)
    SecureRandom.urlsafe_base64(n)
  end


  def reset_token
    self.token = generate_token
    self.save!
    self.token
  end


end
