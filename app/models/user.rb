class User < ActiveRecord::Base
  include Clearance::User
  attr_accessible :firstname, :lastname, :username, :email, :password

end