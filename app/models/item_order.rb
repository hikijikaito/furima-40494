# app/models/item_order.rb
class ItemOrder
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city_name, :block_name, :building_name, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city_name, :block_name, :phone_number, :user_id, :item_id
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  end

  def save
    order = Order.create(user_id:, item_id:)

    Address.create(
      postal_code:,
      prefecture_id:,
      city_name:,
      block_name:,
      building_name:,
      phone_number:,
      order_id: order.id
    )
  end
end
