class CreatePopups < ActiveRecord::Migration
  def change
    create_table :popups do |t|
      t.string :content
      t.string :checking
      t.timestamps null: false
    end
  end
end
