# == Schema Information
#
# Table name: boards
#
#  id         :bigint           not null, primary key
#  content    :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Board < ApplicationRecord
  validates :title, presence: true
  validates :title, length: {minimum:2, maximum:20}
  validates :title, format: { with: /\A(?!\@)/ }

  validates :content, presence: true
  validates :content, length: {minimum:5}
  validates :content, uniqueness: true

  # belongs_to :user

  def display_created_at
    I18n.l(self.created_at, format: :default)
  end
end
