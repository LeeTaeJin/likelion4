class HomeworkController < ApplicationController
  
  before_action :authenticate_user!, only: [:main, :write, :write_process, :homework_write, :homework_writeprocess]
  
  def main
    if Post.where("category=?", "과제").count != 0 
      @view_post=Post.find(params[:view_post])
    else
      @view_post=params[:view_post]
    end       
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
    
    redirect_to action:"main", view_post: @new_post.id
    
  end
  
  def homework_write
    @homework_post=Post.find(params[:homework_post])
  end

  def homework_writeprocess
    new=Homework.new
    new.content=params[:content]
    new.href=params[:address]
    new.user=current_user.id
    new.post_id=params[:homework_post]
    new.save
    
    redirect_to action: "main", view_post: params[:homework_post]
  end
  
end
