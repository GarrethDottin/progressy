class SessionsController < ApplicationController


  def destroy
    sign_out
    redirect_to url_after_destroy
  end


  private

  def url_after_destroy
    root_url
  end
end
