class Sub < ActiveRecord::Base
  attr_accessible :name, :owner_id

  belongs_to( :owner,
  class_name: "User",
  foreign_key: :owner_id,
  primary_key: :id
  )

  has_many(:mod_links,
  class_name: "ModeratorTable",
  foreign_key: :sub_id,
  primary_key: :id
  )

  has_many(:member_links,
  class_name: "MemberTable",
  foreign_key: :sub_id,
  primary_key: :id
  )

  has_many :moderators, through: :mod_links, source: :user
  has_many :members, through: :member_links, source: :user


end
