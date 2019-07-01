if Category.count.zero?
  Category.create!(name: 'Điện tử', created_at: Time.current)
  Category.create!(name: 'Điện thoại', created_at: Time.current)
  Category.create!(name: 'Mẹ và bé', created_at: Time.current)
  Category.create!(name: 'Laptop - Máy tính bảng', created_at: Time.current)
  Category.create!(name: 'Hàng thể thao', created_at: Time.current)
  Category.create!(name: 'Làm đẹp - Sức khoẻ', created_at: Time.current)
  ShopAccount.create!(email: 'sacachi@gmail.com',
                      password: '123456',
                      shop_name: 'Sacachi Shop',
                      phone: '0901222333',
                      address: '123 Ly Tu Trong, TP HCM',
                      tax_code: '22233215',
                      desc: 'Shop moi voi cac san pham moi dep qua troi',
                      created_at: Time.current)
end
