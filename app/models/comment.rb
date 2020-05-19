class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def user_attributes=(user)
    # Create a user if the username is not an empty field, if it is this will be skipped
    if !user[:username].empty?
      self.user = User.find_or_create_by(username: user[:username])
      self.user.update(user)
    end
  end

end
