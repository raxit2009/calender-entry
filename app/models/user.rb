class User < ActiveRecord::Base
attr_accessible :first_name, :last_name, :department, :email, :password, :password_confirmation
  attr_accessor :password
  before_save :encrypt_password
  has_many :events
  has_many :event_series
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :department
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates_uniqueness_of :email
#  def deliver_email(login_url)
#    UserMailer.registration_confirmation(login_url).deliver
#  end
  def send_password_reset
    self.password_reset_token = BCrypt::Engine.generate_salt
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.deliver_password_reset(self)
  end
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
end
