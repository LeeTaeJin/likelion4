class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.integer :user_id #사용자 id
      t.string :state #출석인지 결석인지
      t.date :date #출첵한날짜기록
      t.timestamps null: false
    end
  end
end
#3번중 두번은 필수 =>경고
# 금요일은 필수 목 일은 선택