class Store < ApplicationRecord
    validates :store_id, {presence: true, length: {maximum: 8}}
    validates :store_name, {presence: true, length: {maximum: 30}}
    validates :address, {presence: true, length: {maximum: 50}}
    validates :tel_number, {presence: true, length: {maximum: 10}}
    validates :hp_url, {presence: true, length: {maximum: 100}}
    validates :store_img, {presence: true, length: {maximum: 100}}
end
