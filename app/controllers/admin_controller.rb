class AdminController < ApplicationController
  def main
  end
  
  def delete_user
    @user = User.find(params[:id])
    
    @user.destroy
    redirect_to :back
  end
  
  def edit_user
    @user = User.find(params[:id])
    @user.name = params[:name]
    @user.save
    
    redirect_to :back
  end
  
  def attendance
  end
  
  def attendance_write
    
    User.all.each do |user|
      # @select = ("select_" + user.id.to_s).to_s
      new_attendance = Attendance.new
      new_attendance.user_id = user.id
      new_attendance.state = params["select_#{user.id}"]
      new_attendance.date = params[:date]
      new_attendance.save
    end
    
    redirect_to :back
    
  end
  
  def attendance_modify #수정할것
    User.all.each do |user|
      edit = Attendance.find(params["id_#{user.id}"])
      edit.state = params["select_#{user.id}"] #상태 업데이트
      edit.save
    end
    redirect_to :back
  end
  
  
end
