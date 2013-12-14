class User < ActiveRecord::Base
  include Clearance::User
  attr_accessible :firstname, :lastname, :username, :email, :password
  has_many :resources
  has_many :user_topics
end