class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_number, :prefecture_id, :municipality, :street_address, :building_name, :tel_number, :order_id, :user_id, :item_id
  
  with_options presence: true do
    validates :post_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality
    validates :street_address
    validates :tel_number, format: {with: /\A\d{11}\z/}
    validates :user_id
    validates :item_id 
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    order = Order.create(item_id: item_id, user_id: user_id)

    Address.create(post_number: post_number, prefecture_id: prefecture_id, municipality: municipality, 
                  street_address: street_address, building_name: building_name, tel_number: tel_number, order_id: order.id)
  end
end