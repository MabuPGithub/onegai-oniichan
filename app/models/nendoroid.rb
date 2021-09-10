class Nendoroid < ApplicationRecord
    has_one_attached :main_photo
    has_many_attached :photos

    validates :name, presence: true
    validates :nendoroid_number, presence: true
    validates :series, presence: true
    validates :simple_description, presence: true
    validates :description, presence: true
    validates :price, presence: true
    validates :release_date, presence: true
    validates :pre_order_price, presence: true
    validates :pre_order_date, presence: true
    validates :eta, presence: true
    validates :min_deposit, presence: true

end
