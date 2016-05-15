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
  
  def popup
    Popup.all.each do |pop|
      popup = Popup.find(pop.id)
      #popup.checking = "false"
      popup.save
    end
    
    popup = Popup.new
    popup.content = params[:content]
    #popup.checking =params[:checking]
    popup.save
    
    redirect_to :back
  end
  
  def popup_update
    Popup.all.each do |pop|
      popup = Popup.find(pop.id)
      #popup.checking =params["checking_#{pop.id}"]
      popup.save
    end
    redirect_to :back
  end
end
