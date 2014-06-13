# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  list_id    :integer
#  picker     :string(255)
#

class Task < ActiveRecord::Base
	belongs_to :list
	validates :title, presence: true, length: { minimum: 2, maximum: 30 }
end
