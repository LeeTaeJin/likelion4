class PostController < ApplicationController
  
  before_action :authenticate_user!, only: [:main, :write, :view, :delete, :modify, :modify_action, :reply_write, :reply_delete, :search]
    
  def main
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
    
    redirect_to '/post/main'
  end
  
  def view # 글보기
   
      @view_post = Post.find(params[:id])
  
  end
  
  def delete #삭제
        
        fb_delete= Post.find(params[:id])
        
        
        # if fb_delete.fb_user_id == current_user.id
            
            fb_delete.destroy
                
            redirect_to '/post/main'

        # end
  end
    
  def modify #수정 보기
    
      @modify_post = Post.find(params[:id])
      
  end
  
  def modify_action #수정 처리
    
      # @login_user = User.all
      
      fb_modify = Post.find(params[:id])
      
      
      # if current_user.id == fb_modify.fb_user_id #사용자가 같으면 삭제가능
           
          fb_modify.content = params[:md_content]
          fb_modify.title = params[:md_title]
          fb_modify.save
              
          redirect_to '/post/main'
      # else
           
          # redirect_to :back
      # end 
    
  end
  
  def reply_write
      
      fb_reply = Reply.new
      fb_reply.post_id = params[:post_id]
      fb_reply.user = params[:user]
      fb_reply.content = params[:rp_content]
      # fb_reply.rp_hakbun = params[:rp_hakbun]
      fb_reply.save
    
      redirect_to :back
  end
  
  def reply_delete #리플삭제
       
      rp_delete = Reply.find(params[:reply_id])
      
  
      # if rp_delete.user_id == current_user.id
                  # 같은 이름을 가진 사람이 댓글을 삭제할수도 있으므로 학번으로 바꿔야함.
          
         rp_delete.destroy
          redirect_to :back
          
      # elsif current_user.email == "admin@ptu.ac.kr"
          
          # rp_delete.destroy
          # redirect_to :back
      # else
          
          # redirect_to :back
      # end
  end

    
    def search #검색
      @searching_keyword=params[:searching_keyword]
      @search_output=Post.where("category=?","공지사항").where("title LIKE ? or content LIKE ?", "%#{@searching_keyword}%", "%#{@searching_keyword}%")
    end
    


end
