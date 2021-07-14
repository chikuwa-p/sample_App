class List < ApplicationRecord
  #validates :title, presence: { message: 'を入力してください' }
  validates :title, presence: true
  validates :body, presence: true
end
