class Picture < ActiveRecord::Base
  attr_accessible :description, :name, :pictures 
  belongs_to :post, :dependent => :destroy  

  has_attached_file :photo, 
    :styles => { :medium => "300x300>", :thumb => "100x100>" },
    :path => ":rails_root/public/images/:id/:filename",
    :url => "/images/:id/:filename",
    :default_url => "/images/:style/missing.png"
  
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/  
  
  def editable_by?(user)
    user && user == owner
  end
end
