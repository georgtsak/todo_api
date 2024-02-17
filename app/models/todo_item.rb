class TodoItem < ApplicationRecord
  belongs_to :todo
  validates :content, presence: true
end
