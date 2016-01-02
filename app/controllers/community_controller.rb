class CommunityController < ApplicationController
  
  before_action :authenticate_user!, only: [:main, :write, :write_process]
  
  def main
    @posting=params[:posting]
  end
  
  def write
  end
  
  def write_process #글쓰기 처리
    @new_post = Post.new
    @new_post.title = params[:title]
    @new_post.user = params[:user]
    @new_post.category = params[:category]
    @new_post.content = params[:content]
    @new_post.save
    
    redirect_to action:"main", posting: params[:category]
  end
end
