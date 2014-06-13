# == Schema Information
#
# Table name: lists
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  slug        :string(255)
#
class List < ActiveRecord::Base
	has_many :tasks, dependent: :destroy
	validates :title, presence: true, length: { minimum: 2, maximum: 30 }
	validates :slug, uniqueness: true, presence: true, 
                    exclusion: { in: %w[admin signup signin signout help about contact terms privacy]}
	before_validation :create_unique_slug

	def to_param
		slug
	end

	def create_unique_slug
	  begin
	    self.slug = SecureRandom.hex[0,8]
	  end while self.class.exists?(slug: slug)
	end
end