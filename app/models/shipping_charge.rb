class ShippingCharge < ActiveHash::Base
  self.data = [
    {id: 1, name: '送料込み（出品者負担）'}, {id: 2, name: '送料込み（購入者負担）'} ]
end