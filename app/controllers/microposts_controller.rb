class MicropostsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: :destroy

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end


  def destroy
    @micropost.destroy
    redirect_to root_url
  end
  
  def edit
    @micropost = Micropost.find_by(id: micropost_params[:id])
    render 'microposts/edit'
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content, :image)
    end
    
    def micropost_update_params
      params.require(:micropost).permit(:content, :image)
    end
    
    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end



end
