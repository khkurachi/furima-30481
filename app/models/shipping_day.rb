class ShippingDay < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '1〜２日' },
    { id: 3, name: '2〜3日' },
    { id: 4, name: '4〜７日' },
  ]
end
