class Resource < ActiveRecord::Base
  attr_accessible :content, :list_id
  belongs_to :list
end
