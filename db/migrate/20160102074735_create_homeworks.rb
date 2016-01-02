class CreateHomeworks < ActiveRecord::Migration
  def change
    create_table :homeworks do |t|
      
      t.string :post_num
      t.string :user
      t.string :content
      t.string :href
      
      t.timestamps null: false
    end
  end
end
