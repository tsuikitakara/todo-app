# == Schema Information
#
# Table name: boards
#
#  id         :bigint           not null, primary key
#  content    :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_boards_on_user_id  (user_id)
#
class Board < ApplicationRecord
    has_one_attached :eyecatch

    validates :title, presence: true
    validates :content, presence: true
    
    has_many :tasks, dependent: :destroy
    belongs_to :user
end
