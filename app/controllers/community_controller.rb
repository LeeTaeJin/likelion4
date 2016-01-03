class CommunityController < ApplicationController
  
  before_action :authenticate_user!, only: [:main, :write, :write_process, :search, :view]
  
  def main
    @posting=params[:posting]
  end
  
  def view
    @view_post = Post.find(params[:id])
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
  
  def search #검색
    @searching_keyword=params[:searching_keyword]
    @search_output=Post.where("category =? or category =?", "아이디어", "잡담").where("title LIKE ? or content LIKE ?", "%#{@searching_keyword}%", "%#{@searching_keyword}%")
  end
end
