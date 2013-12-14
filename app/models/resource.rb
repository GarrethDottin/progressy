class Resource < ActiveRecord::Base
  attr_accessible :content, :list_id
  belongs_to :list
  belongs_to :user
end
