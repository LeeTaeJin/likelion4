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
  
  def modify
    @modify_project=Project.find(params[:id])
  end
  
  def modify_process
    
    edit = Project.find(params[:id])
    edit.title = params[:title]
    edit.team_leader = params[:team_leader]
    edit.team_member = params[:team_member]
    edit.content = params[:content]
    edit.address = params[:address]
    edit.save
    
    redirect_to action: "main", view_post: params[:id]
    
  end
  
  def delete
    @project=params[:id].to_i
    delete_project=Project.find(@project)
    delete_project.destroy
    
    if Project.count == 0
      redirect_to action: "main", view_post: "등록된 프로젝트가 없습니다."
    else
      redirect_to action: "main", view_post: Project.last.id
    end
    
  end
  
end
