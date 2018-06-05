class HomeController < ApplicationController
  def show
    if current_user
      unless Post.nil?
        @posts = Post.where(:pid => current_user.id).where(:arrive => false).all
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
    redirect_to root_path
  end

  def create
    if Post.where(:pid => current_user.id).where(:arrive => false).empty?
       @post = Post.new
       @post.address = params[:input_address]
       @post.pid = current_user.id
       @post.arrive = false
       @post.save
     end
     redirect_to home_show_path
  end
  def arrive
    @post = Post.find(session[:pid])
    @post.arrive = true
    @post.save
  end
end
