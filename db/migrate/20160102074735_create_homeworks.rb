class CreateHomeworks < ActiveRecord::Migration
  def change
    create_table :homeworks do |t|
      
      t.integer :post_id
      t.integer :user
      t.string :content
      t.string :href
      
      t.timestamps null: false
    end
  end
end
