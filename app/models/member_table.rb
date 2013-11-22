class MemberTable < ActiveRecord::Base
  attr_accessible :sub_id, :user_id

  belongs_to(:sub,
  class_name: "Sub",
  foreign_key: :sub_id,
  primary_ley: :id
  )

  belongs_to(:member,
  class_name: "User",
  foreign_key: :user_id,
  primary_ley: :id
  )

end
