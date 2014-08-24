class Picture < ActiveRecord::Base
  #attr_accessible :description, :post_id, :photo
  belongs_to :post

  has_attached_file :photo, 
    :styles => { :medium => "300x300>", :thumb => "100x100>" },
    :path => ":rails_root/public/images/:style/:id-:filename",
    :url => "/images/:style/:id-:filename",
    :default_url => "/images/:style/missing.png"
  
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/  
  
  def editable_by?(user)
    user && user == owner
  end
end
