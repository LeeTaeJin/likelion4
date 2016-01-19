class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      
      t.string :title
      t.integer :writer
      t.string :team_leader
      t.string :team_member
      t.string :content
      t.string :address
      
      t.timestamps null: false
    end
  end
end
