class Group < ActiveRecord::Base
  belongs_to :user #@group.user will be the group leader
  has_many :memberships
  has_many :users, through: :memberships # @group.users would give all users in group

#### Validations
	validates :name, presence: true, length: { minimum: 5 }
	validates :description, presence: true, length: { minimum: 10 }
end


  # create_table "groups", force: true do |t|
  #   t.string   "name"
  #   t.string   "description"
  #   t.integer  "user_id"
  #   t.datetime "created_at"
  #   t.datetime "updated_at"
  # end