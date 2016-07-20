class Like < ActiveRecord::Base
  belongs_to :chef
  belongs_to :recipe

  validates_uniqueness_of :chef, scope: :recipe

  def check_like_or_dislike(chef_id, recipe_id)

  end

end