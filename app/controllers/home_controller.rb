class HomeController < ApplicationController
  def show
    unless Post.nil?
      @posts = Post.all
      @hash = Gmaps4rails.build_markers(@posts) do |posts, marker|
        marker.lat posts.latitude
        marker.lng posts.longitude
      end
    end

end

  def new
    @posts = Post.all
  end

  def create
     @post = Post.new
     @post.address = params[:input_address]

     @post.save

     redirect_to root_path
  end
end
