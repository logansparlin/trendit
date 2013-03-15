class User < ActiveRecord::Base

  attr_accessible :first_name, :last_name, :email, :password, :full_name

  # Max & min lengths for all fields
  NAME_MIN_LENGTH = 3
  NAME_MAX_LENGTH = 25
  PASSWORD_MIN_LENGTH =6
  PASSWORD_MAX_LENGTH = 40
  EMAIL_MAX_LENGTH = 50
  NAME_RANGE = NAME_MIN_LENGTH..NAME_MAX_LENGTH
  PASSWORD_RANGE = PASSWORD_MIN_LENGTH..PASSWORD_MAX_LENGTH

  validates_uniqueness_of :email
  validates_presence_of :first_name, :message => "^First name is required, "
  validates_presence_of :last_name, :message => "^Last name is required, "
  validates_presence_of :password, :message => "^Password is required."
  validates_length_of :last_name, :within => NAME_RANGE, :message => "^"
  validates_length_of :password, :within => PASSWORD_RANGE, :message => "^"
  

  validates_format_of :first_name,
  					          :with => /^[A-Z]*$/i,
  					          :message => "^"

  validates_format_of :first_name,
                      :with => /^[A-Z]*$/i,
                      :message => "^"

  validates_format_of :email,
        				      :with => /^[A-Z0-9._%-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}$/i,
        				      :message => "^Email is not valid"
  validates_format_of :password,
          					  :with => /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+/,
          					  :message => "^Password must contain at least one uppercase and lowercase letter and a number."

  before_create :create_full_name

  def create_full_name
    self.full_name = "#{first_name.capitalize} #{last_name.capitalize}"
  end
end
