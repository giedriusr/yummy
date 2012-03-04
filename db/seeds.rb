# truncating all tables

def truncate(table)
  config = ActiveRecord::Base.configurations[Rails.env]
  ActiveRecord::Base.establish_connection
  case config["adapter"]
    when "mysql2"
      ActiveRecord::Base.connection.execute("TRUNCATE #{table}")
    when "sqlite", "sqlite3"
      ActiveRecord::Base.connection.execute("DELETE FROM #{table}")
      ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence where name='#{table}'")
      ActiveRecord::Base.connection.execute("VACUUM")
  end
end

truncate('providers')
truncate('offices')
truncate('menus')
truncate('items')
truncate('categorizations')
truncate('ingredients')
truncate('ingredient_categorizations')
truncate('customers')
truncate('customer_delivery_addresses')
truncate('employees')

# seeding with dummy data
Provider.create([
  { name: 'Domino', password: '123456', phone: '3098765412', email: 'domino@fakeemail.gr'},
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
  { provider_id: 1, name: 'Xoriatiki salads', price: 6.5, description: 'greek traditional salads'},
  { provider_id: 1, name: 'Coca cola', price: 3.5, description: 'coca cola drink'},
  { provider_id: 1, name: 'Pizza', price: 8.5, description: 'coca cola drink'}
])

Categorization.create([
  { menu_id: 1, item_id: 1},
  { menu_id: 2, item_id: 2},
  { menu_id: 6, item_id: 3},
  { menu_id: 7, item_id: 3}
])

Ingredient.create([
  { provider_id: 1, name: 'chilly'},
  { provider_id: 1, name: 'spicy'}
])

IngredientCategorization.create([
  { ingredient_id: 1, item_id: 1},
  { ingredient_id: 2, item_id: 2},
  { ingredient_id: 1, item_id: 3}
])

Customer.create([
  { email: 'customer@fakeemail.com', password: '123456', first_name: 'Giedrius', last_name: 'Rimkus', phone: '1234321'},
  { email: 'info@giedriusr.lt', password: '123456', first_name: 'Giedriukas', last_name: 'Rimkiukas', phone: '0987632'},
  { email: 'diusha13@gmail.com', password: '123456', first_name: 'Andreas', last_name: 'Taranuta', phone: '4234345'}
])

CustomerDeliveryAddress.create([
  { customer_id: 1, country_code: 'GR', address: 'Saripoulou 10-8', city: 'Athens'},
  { customer_id: 1, country_code: 'GR', address: 'Saripoulou 10-8', city: 'Athens'},
  { customer_id: 2, country_code: 'GR', address: 'Faliro', city: 'Athens'}
])

Employee.create([
  { first_name: 'Employee', last_name: 'Employeeee', email: 'employee@fakeemail.com', password: '123456'},
  { first_name: 'Admin', last_name: 'Demo', email: 'employee2@fakeemail.com', password: '123456'}
])