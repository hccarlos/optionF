class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
end


  # create_table "memberships", force: true do |t|
  #   t.integer  "user_id"
  #   t.integer  "group_id"
  #   t.datetime "created_at"
  #   t.datetime "updated_at"
  # end