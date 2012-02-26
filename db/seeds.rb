# truncating all tables
ActiveRecord::Base.connection.execute("TRUNCATE `providers`")
ActiveRecord::Base.connection.execute("TRUNCATE `offices`")
ActiveRecord::Base.connection.execute("TRUNCATE `menus`")
ActiveRecord::Base.connection.execute("TRUNCATE `items`")
ActiveRecord::Base.connection.execute("TRUNCATE `categorizations`")
ActiveRecord::Base.connection.execute("TRUNCATE `ingredients`")
ActiveRecord::Base.connection.execute("TRUNCATE `ingredient_categorizations`")
ActiveRecord::Base.connection.execute("TRUNCATE `customers`")
ActiveRecord::Base.connection.execute("TRUNCATE `customer_delivery_addresses`")

# seeding with dummy data
Provider.create([
  { name: 'Domino', user_name: 'domino', password: '123456', phone: '123456789', email: 'domino@email.gr'},
  { name: 'Pizza Hat', user_name: 'pizzahat', password: '123321', phone: '1364332344', email: 'pizzahat@email.gr'},
  { name: 'La Pasteria', user_name: 'lapasteria', password: '123asw', phone: '12345345', email: 'lapasteria@email.gr'},
  { name: 'Grill Academy', user_name: 'grillac', password: '123sde', phone: '12345643', email: 'grillac@email.gr'},
  { name: 'Loukoumades', user_name: 'loukoma', password: '123vbg', phone: '123433565', email: 'loukoma@email.gr'}
])

Office.create([
  { provider_id: 1, name: 'Domino Nea smyrni', address: 'nea smyrni', city: 'Athens', country_code: 'GR', email: 'neasmyrnidomino@email.gr'},
  { provider_id: 1, name: 'Domino Kallithea', address: 'kallithea', city: 'Athens', country_code: 'GR', email: 'kallitheadomino@email.gr'},
  { provider_id: 2, name: 'PizzaHat Kallithea', address: 'Pireauas', city: 'Piraeus', country_code: 'GR', email: 'pirpizza@email.gr'}
])

Menu.create([
  { provider_id: 1, name: 'Salads'},
  { provider_id: 1, name: 'Drinks'},
  { provider_id: 2, name: 'Salads'},
  { provider_id: 2, name: 'Meals'},
  { provider_id: 3, name: 'Salads'}
])

Item.create([
  { name: 'Country salads', price: 6.5, description: 'greek traditional salads'},
  { name: 'Coca cola', price: 3.5, description: 'coca cola drink'}
])

Categorization.create([
  { menu_id: 1, item_id: 1},
  { menu_id: 2, item_id: 2}
])

Ingredient.create([
  { name: 'chilly'},
  { name: 'spicy'}
])

Customer.create([
  { email: 'giedrius.rim@gmail.com', first_name: 'Giedrius', last_name: 'Rimkus', phone: '1234321'},
  { email: 'info@giedriusr.lt', first_name: 'Giedriukas', last_name: 'Rimkiukas', phone: '0987632'},
  { email: 'diusha13@gmail.com', first_name: 'Andreas', last_name: 'Taranuta', phone: '4234345'}
])

CustomerDeliveryAddress.create([
  { customer_id: 1, country_code: 'GR', address: 'Saripoulou 10-8', city: 'Athens'},
  { customer_id: 1, country_code: 'GR', address: 'Saripoulou 10-8', city: 'Athens'},
  { customer_id: 2, country_code: 'GR', address: 'Faliro', city: 'Athens'}
])