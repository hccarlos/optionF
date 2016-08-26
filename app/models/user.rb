class User < ActiveRecord::Base
  has_secure_password

  has_many :groups # user acts as group leader
  has_many :memberships # user can have many memberships
  has_many :group_memberships, through: :memberships, source: :group #user.group_memberships will find all groups that user is in

#### Validations
	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :password, confirmation: true

  before_save do
  	self.email.downcase!
  end
end


  # create_table "users", force: true do |t|
  #   t.string   "first_name"
  #   t.string   "last_name"
  #   t.string   "email"
  #   t.string   "password_digest"
  #   t.datetime "created_at"
  #   t.datetime "updated_at"
  # end