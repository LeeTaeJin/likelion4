class Project < ActiveRecord::Base
    
  mount_uploader :image, ImageuploaderUploader
end
