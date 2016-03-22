class StaticPagesController < ApplicationController
  def home


    respond_to do |format|
      format.html { redirect_to signin_path }
      format.js { render :json => { :signin => "<a href='#'>Sign in</a>", :signup => "<a href='#'>Sign up</a>" } }
    end
  end
end
