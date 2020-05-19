class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  # accepts_nested_attributes_for :categories, reject_if: proc {|attributes| attributes[0][name].blank? }
  accepts_nested_attributes_for :comments, reject_if: proc {|attributes| attributes['username'].blank?}
  
  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      unless category_attribute[:name].blank?
      category = Category.find_or_create_by(category_attribute)
      self.post_categories.build(category: category)
      end
    end
  end

  def comment_users
    users = []
    self.comments.each do |c|
      users << c.user
    end
    users.uniq
  end
end

