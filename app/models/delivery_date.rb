class DeliveryDate < ActiveHash::Base
  self.data = [
    { id: 0, date: '---' },
    { id: 1, date: '１〜２日で発送' },
    { id: 2, date: '２〜３日で発送' },
    { id: 3, date: '４〜７日で発送' }
  ]

  include ActiveHash::Associations
  has_many :items

  end