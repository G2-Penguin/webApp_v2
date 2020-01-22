class Product < ApplicationRecord
    #validates :product_id, {presence: true, length: {maximum: 15}}
    validates :product_name, {presence: true, length: {maximum: 20}}
    validates :price, {presence: true, length: {maximum: 5}}
    validates :discount_rate, {length: {maximum: 2}}
    validates :category, {presence: true, length: {maximum: 5}}
    validates :amount, {presence: true, length: {maximum: 5}}
    #validates :product_img, {length: {maximum: 100}}
    validates :count, {presence: true, length: {maximum: 6}}
    validates :product_store, {presence: true, length: {maximum: 8}}
    #validates :time, {presence: true, length: {maximum: 15}}
end
