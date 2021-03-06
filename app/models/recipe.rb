class Recipe < ActiveRecord::Base
  belongs_to :chef
  has_many  :likes
  validates :name, presence: true, length: {minimum: 5, maximum: 100}
  validates :summary, presence: true, length: {minimum: 10, maximum: 150}
  validates :description, presence: true, length: {minimum: 20, maximum: 4000}
  validates :chef_id, presence: true
  validates :picture, presence: true
  mount_uploader :picture, PictureUploader
  validate :picture_size

  def thumbs_up_total
    self.likes.where(like: true).size
  end

  def thumbs_down_total
    self.likes.where(like: false).size
  end

  private
  def picture_size
    if picture.size > 5.megabyte
      errors.add(:picture, "should be less than 5MB")
    end
  end
end