class LineItem < ApplicationRecord
    belongs_to :nendoroid
    belongs_to :cart
    belongs_to :order

    def total_price
        self.quantity * self.nendoroid.price
    end
end
