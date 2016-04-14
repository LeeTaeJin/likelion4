class HomeController < ApplicationController
  def main
    if defined?params[:people]
      @people=params[:people]
    end
  end
  
  def search
    @searching_keyword=params[:searching_keyword]
    @search_output_idea=Post.where("category =?","아이디어").where("title LIKE ? or content LIKE ?", "%#{@searching_keyword}%", "%#{@searching_keyword}%")
    @search_output_post=Post.where("category =?","공지사항").where("title LIKE ? or content LIKE ?", "%#{@searching_keyword}%", "%#{@searching_keyword}%")
    @search_output_project=Project.where("title LIKE ? or content LIKE ?", "%#{@searching_keyword}%", "%#{@searching_keyword}%")
    
  end
  
end
