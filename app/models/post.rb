class Post < ActiveRecord::Base
  belongs_to :owner, :class_name => "User", :foreign_key => :user_id
  has_many :comments, :dependent => :destroy  
  validates :title, :owner, :presence => true
  
  #attr_accessible :description, :name, :pictures 
  has_many :pictures, :dependent => :destroy  
  
  def editable_by?(user)
    user && user == owner
  end
end
