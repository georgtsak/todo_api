class Todo < ApplicationRecord
  has_many :todo_items, dependent: :destroy
end