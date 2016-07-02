class Post < ActiveRecord::Base
    
  has_many :replies
  has_many :homeworks
  
end
