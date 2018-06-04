class HomeController < ApplicationController
  def show
    if current_user
      unless Post.nil?
        @posts = Post.all
        @hash = Gmaps4rails.build_markers(@posts) do |posts, marker|
          marker.lat posts.latitude
          marker.lng posts.longitude
        end
      end
    else
      redirect_to root_path
    end
  end

  def landing
    if current_user
        redirect_to home_show_path
      end
  end
  def new
    @posts = Post.all
  end

  def create
     @post = Post.new
     @post.address = params[:input_address]
     @post.save
     redirect_to home_show_path
  end
end
