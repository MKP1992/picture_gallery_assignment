class Picture < ApplicationRecord
  validates :title, uniqueness: true
  validates :title, :picture_img, presence: true
	validate :category_id_exists
  has_attached_file :picture_img, styles: { :picture_index => "250x350>", :picture_show => "325x475>" }, default_url: ":style/missing.jpeg"
  validates_attachment_content_type :picture_img, content_type: /\Aimage\/.*\z/

  belongs_to :user
  belongs_to :category
  
	private
	def category_id_exists
	  return false if Category.find_by_id(self.category_id).nil?
	end  
end
