class Link < ActiveRecord::Base
  attr_accessible :description, :poster_id, :title, :url
end
