class Post < ActiveRecord::Base
  belongs_to :owner, :class_name => "User", :foreign_key => :user_id
  has_many :comments, :dependent => :destroy  
  validates :title, :owner, :presence => true
  
  attr_accessible :description, :name, :pictures 
  has_many :pictures, :dependent => :destroy  

  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/  
  
  def editable_by?(user)
    user && user == owner
  end
end
