# == Schema Information
#
# Table name: tasks
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  deadline   :date             not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_tasks_on_board_id  (board_id)
#  index_tasks_on_user_id   (user_id)
#
class Task < ApplicationRecord
  has_one_attached :eyecatch

  validates :title, presence: true
  validates :title, length: {minimum:2, maximum:20}
  validates :title, format: { with: /\A(?!\@)/ }

  validates :content, presence: true
  validates :content, length: {minimum:5}
  validates :content, uniqueness: true
  
  belongs_to :user
  belongs_to :board
end
