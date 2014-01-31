class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def about
  end	

  def listing
   if signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def contact
  end 
end
  