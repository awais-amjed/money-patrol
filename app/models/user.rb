class User < ApplicationRecord
  has_many :categories, dependent: :destroy
end
