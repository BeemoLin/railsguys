class Picture < ActiveRecord::Base
  #attr_accessible :description, :post_id, :photo
  belongs_to :post

  has_attached_file :photo, 
    :styles => { :medium => "300x300>" },
    :path => ":rails_root/public/system/:class/:attachment/:id/:basename/:style.:extension",
    :url => "/system/:class/:attachment/:id/:basename/:style.:extension",
    :default_url => "/images/:style/missing.png"
  
  validates_attachment_size :photo, :less_than => 5.megabytes  
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
  
  def editable_by?(user)
    user && user == owner
  end
end
