class MicropostsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

   def new
     if signed_in?
      @micropost = Micropost.new 
    end
   end

   def show
    @micropost = Micropost.find(params[:id]) 
   end 

   def index
    @microposts = Micropost.paginate(page: params[:page])
   end

   def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to @micropost
    else
      @feed_items = []
      render 'new'
    end
  end
  
  def destroy
    Micropost.find(params[:id]).destroy
    flash[:success] = "Post deleted."
    redirect_to root_url
  end




  private

    def micropost_params
      params.require(:micropost).permit(:content, :houseprice, :ptitle, :psqft, :pbed, :pbath, :pzip, :paddress, :pcity, :pstate, :pfurnsih, :pcats, :pdogs,:psmoke, :plaundry, :pparking)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to listing_url if @micropost.nil?
    end
end