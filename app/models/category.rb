class Category < ApplicationRecord
  belongs_to :user
  has_many :expenses, dependent: :destroy

  validates :name, presence: true
  validates :icon, presence: true
  validates :author_id, presence: true
end
