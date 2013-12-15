class HomepagesController < ApplicationController
  def index
    @user = User.new
  end
end