class Comment < ActiveRecord::Base
  attr_accessible :content, :link_id, :parent_id, :poster_id
end
