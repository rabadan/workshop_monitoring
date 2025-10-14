class Order < ApplicationRecord
  after_create :track_order

  private

  def track_order
    Yabeda.top_shop.orders_placed.increment
    Yabeda.top_shop.money_earned.increment({}, by: amount)
  end
end
