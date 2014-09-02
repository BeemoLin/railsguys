module PostsHelper
  def comment_user(id)
   user = User.select(:email).where(User.arel_table[:id].eq(id)).order(:created_at).reverse_order
   
   if user.empty?
     email||= ''
   else
     email||= user[0].email
   end
   
   return email
  end
end
