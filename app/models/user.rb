class User < ActiveRecord::Base
  include Clearance::User
  attr_accessible :firstname, :lastname, :username, :email, :password
  attr_reader :admin
  has_many :user_topics
  has_many :resources
end