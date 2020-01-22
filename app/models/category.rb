class Category < ApplicationRecord
    validates :category_id, {presence: true, length: {maximum: 1}}
    validates :category_name, {presence: true, length: {maximum: 5}}
end
