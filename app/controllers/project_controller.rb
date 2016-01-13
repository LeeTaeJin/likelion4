class ProjectController < ApplicationController
  
  def main
    if Project.count != 0 
      @view_post=Project.find(params[:view_post])
    else
      @view_post=params[:view_post]
    end     
  end
  
  def write
  end
  
  def write_process
    
    new = Project.new
    new.title = params[:title]
    new.writer = current_user.id
    new.team_leader = params[:team_leader]
    new.team_member = params[:team_member]
    new.content = params[:content]
    new.address = params[:address]
    new.save
    
    redirect_to action: "main", view_post: Project.last.id
  end
  
end
