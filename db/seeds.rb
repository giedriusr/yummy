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
ActiveRecord::Base.connection.execute("TRUNCATE `employees`")

# seeding with dummy data
Provider.create([
  { name: 'Domino', password: '123123', phone: '12356787', email: 'domino@email.gr'},
  { name: 'Pizza Hat', password: '123321', phone: '1364332344', email: 'pizzahat@email.gr'},
  { name: 'La Pasteria', password: '123asw', phone: '12345345', email: 'lapasteria@email.gr'},
  { name: 'Grill Academy', password: '123sde', phone: '12345643', email: 'grillac@email.gr'},
  { name: 'Loukoumades', password: '123vbg', phone: '123433565', email: 'loukoma@email.gr'}
])

Office.create([
  { provider_id: 1, name: 'Domino Nea smyrni', address: 'nea smyrni', city: 'Athens', country_code: 'GR', email: 'neasmyrnidomino@email.gr', phone: 123441232},
  { provider_id: 1, name: 'Domino Kallithea', address: 'kallithea', city: 'Athens', country_code: 'GR', email: 'kallitheadomino@email.gr', phone: 238472983},
  { provider_id: 2, name: 'PizzaHat Kallithea', address: 'Pireauas', city: 'Piraeus', country_code: 'GR', email: 'pirpizza@email.gr', phone: 238472983}
])

Menu.create([
  { provider_id: 1, name: 'Salads'},
  { provider_id: 1, name: 'Drinks'},
  { provider_id: 2, name: 'Salads'},
  { provider_id: 2, name: 'Meals'},
  { provider_id: 3, name: 'Salads'},
  { provider_id: 3, name: 'Pizzas'},
  { provider_id: 1, name: 'Meals'}
])

Item.create([
  { name: 'Xoriatiki salads', price: 6.5, description: 'greek traditional salads'},
  { name: 'Coca cola', price: 3.5, description: 'coca cola drink'},
  { name: 'Pizza', price: 8.5, description: 'coca cola drink'}
])

Categorization.create([
  { menu_id: 1, item_id: 1},
  { menu_id: 2, item_id: 2},
  { menu_id: 6, item_id: 3},
  { menu_id: 7, item_id: 3}
])

Ingredient.create([
  { name: 'chilly'},
  { name: 'spicy'}
])

IngredientCategorization.create([
  { ingredient_id: 1, item_id: 1},
  { ingredient_id: 2, item_id: 2},
  { ingredient_id: 1, item_id: 3}
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

Employee.create([
  { first_name: 'Giedrius', last_name: 'Rimkus', email: 'giedrius.rim@gmail.com', password: '123'}
])