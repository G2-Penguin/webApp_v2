class User < ApplicationRecord
    validates :admin_name, {presence: true, length: {maximum: 10}}
    validates :user_id, {presence: true, length: {maximum: 10}, uniqueness: true}
    #validates :store_id, {presence: true, length: {maximum: 8}}
    validates :password, {presence: true, length: {maximum: 20}}
    validates :is_admin, {length: {maximum: 1}}
end
