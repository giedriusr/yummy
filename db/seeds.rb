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
# with ID's it doesn't work :(

# PROVIDERS and their related stuff

# Domino Pizza
# 1
Provider.create([ name: 'Domino Pizza', password: '123456', phone: '302130048400', email: 'domino@fakeemail.gr'])
# 1-4
Office.create([ provider_id: 1, address: 'Lenorman 89', city: 'Athens', country_code: 'GR', phone: '302130048400', email: 'domino1@fakeemail.gr', post_code: '10441'])
Office.create([ provider_id: 1, address: 'Aristonikou 1', city: 'Athens', country_code: 'GR', phone: '302109246375', email: 'domino2@fakeemail.gr', post_code: '11636'])
Office.create([ provider_id: 1, address: 'Katechaki 27', city: 'Athens', country_code: 'GR', phone: '302106962850', email: 'domino3@fakeemail.gr', post_code: '11525'])
Office.create([ provider_id: 1, address: '7 KAPNIKAREAS', city: 'Athens', country_code: 'GR', phone: '302103222706', email: 'domino4@fakeemail.gr', post_code: '10556'])
# 1-7
Menu.create([{ provider_id: 1, name: 'Pizzas', photo: 'pizza.jpg'}])
Menu.create([{ provider_id: 1, name: 'Breadbowl Pasta', photo: 'pasta.jpg'}])
Menu.create([{ provider_id: 1, name: 'Oven Baked Sandwiches', photo: 'sandwich.jpg'}])
Menu.create([{ provider_id: 1, name: 'Chicken', photo: 'chicken.jpg'}])
Menu.create([{ provider_id: 1, name: 'Breads', photo: 'bread.jpg'}])
Menu.create([{ provider_id: 1, name: 'Drinks', photo: 'drinks.jpg'}])
Menu.create([{ provider_id: 1, name: 'Deserts', photo: 'dessert.jpg'}])

# 1-19
# pizza
Item.create([{ provider_id: 1, name: 'Hand Tossed', price: 10, description: 'Our garlic-seasoned crust with a rich, buttery taste.'}])
Item.create([{ provider_id: 1, name: 'Deep Dish', price: 12, description: 'Extra thick to support potential topping overload.'}])
# pasta
Item.create([{ provider_id: 1, name: 'Chicken Alfredo', price: 7, description: 'Grilled 100% all white meat chicken and Alfredo sauce baked to a creamy goodness with penne pasta.'}])
# sandwich
Item.create([{ provider_id: 1, name: 'Italian Sausage and Peppers', price: 3.4, description: 'Sliced Italian sausage, roasted red peppers, green peppers, banana peppers, onions, provolone cheese and tomato basil marinara. All on our artisan Italian bread and baked to a golden brown.'}])
Item.create([{ provider_id: 1, name: 'Buffalo Chicken', price: 4.4, description: 'Tender cuts of seasoned all white meat chicken breast, creamy blue cheese, onions, hot sauce, cheddar & provolone cheese. All on our artisan Italian bread and baked to a perfect golden brown.'}])
Item.create([{ provider_id: 1, name: 'Chicken Habanero', price: 2.95, description: 'A SWEET & SPICY medley, made with all white meat chicken breast, pineapple, jalapenos, sweet mango habanero sauce, provolone & cheddar cheese. On artisan Italian bread & baked to a golden brown.'}])
Item.create([{ provider_id: 1, name: 'Chicken Bacon Ranch', price: 6.95, description: 'Tender cuts of Seasoned All White Meat Chicken Breast, Smoked Bacon, Creamy Ranch, and Premium Provolone Cheese all loaded on an Artisan Italian Bread and baked to a perfect golden brown.'}])
# chicken
Item.create([{ provider_id: 1, name: 'Boneless Chicken', price: 11.25, description: 'Our boneless chicken is lightly breaded with savory herbs, made with 100% white breast meat. Customize with your choice of dipping sauce: Kicker Hot Sauce, Sweet Mango Habanero, BBQ, Ranch or Blue Cheese.'}])
Item.create([{ provider_id: 1, name: 'Chicken Wings', price: 13.35, description: 'Our chicken wings are now tastier than ever. Sauced with your choice of Hot, Sweet Mango Habanero or BBQ Sauce.'}])
# bread
Item.create([{ provider_id: 1, name: 'Stuffed Cheesy Bread', price: 1.45, description: 'Oven baked breadsticks stuffed with cheese, and covered in a blend of cheese made with 100% Mozzarella and Cheddar Cheese. Seasoned with a sprinkling of garlic, parsley and Romano cheese. 8 pieces of delicious, cheesy indulgence! Add Marinara or your favorite dipping cup for an additional charge.'}])
Item.create([{ provider_id: 1, name: 'Stuffed Cheesy Bread with Spinach & Feta', price: 3.41, description: 'Oven baked breadsticks stuffed with cheese, fresh spinach and Feta cheese - covered in a blend of cheese made with 100% Mozzarella and Cheddar Cheese. Seasoned with a sprinkling of garlic, parsley and Romano cheese. Add Marinara or your favorite dipping cup for an additional charge.'}])
Item.create([{ provider_id: 1, name: 'Stuffed Cheesy Bread with Bacon & Jalapeno', price: 4.11, description: 'Oven baked breadsticks stuffed with cheese, smoked bacon and jalapeno peppers - covered in a blend of cheese made with 100% Mozzarella and Cheddar Cheese. Seasoned with a sprinkling of garlic, parsley and Romano cheese. Add Marinara or your favorite dipping cup for an additional charge.'}])
Item.create([{ provider_id: 1, name: 'Breadsticks', price: 0.69, description: 'Oven baked breadsticks sprinkled with a flavorful blend of garlic, Romano cheese and parsley. Golden brown, warm and delicious - breadsticks are served with marinara sauce for dipping. Or, try them with garlic dipping sauce or ranch. A tasty addition to your meal.'}])
# drinks
Item.create([{ provider_id: 1, name: 'Coke', price: 0.79, description: 'The authentic cola sensation that is a refreshing part of sharing life\'s enjoyable moments'}])
Item.create([{ provider_id: 1, name: 'Coke Zero', price: 0.79, description: 'Real Coca-Cola taste with zero calories'}])
Item.create([{ provider_id: 1, name: 'Diet Coke', price: 0.79, description: 'Beautifully balanced adult cola taste in a no calorie beverage'}])
Item.create([{ provider_id: 1, name: 'Sprite', price: 0.89, description: 'Unique Lymon (lemon-lime) flavor, clear, clean and crisp with no caffeine.'}])
# deserts
Item.create([{ provider_id: 1, name: 'Chocolate Lava Crunch Cakes', price: 3.80, description: 'Oven baked chocolate cakes, crunchy on the outside with molten chocolate on the inside.'}])
Item.create([{ provider_id: 1, name: 'Cinna Stix', price: 2.30, description: 'Sprinkled with cinnamon and sugar, then baked to perfection. Served with sweet icing.'}])

# 1-19
Categorization.create([
  { menu_id: 1, item_id: 1},
  { menu_id: 1, item_id: 2},
  { menu_id: 2, item_id: 3},
  { menu_id: 3, item_id: 4},
  { menu_id: 3, item_id: 5},
  { menu_id: 3, item_id: 6},
  { menu_id: 3, item_id: 7},
  { menu_id: 4, item_id: 8},
  { menu_id: 4, item_id: 9},
  { menu_id: 5, item_id: 10},
  { menu_id: 5, item_id: 11},
  { menu_id: 5, item_id: 12},
  { menu_id: 5, item_id: 13},
  { menu_id: 6, item_id: 14},
  { menu_id: 6, item_id: 15},
  { menu_id: 6, item_id: 16},
  { menu_id: 6, item_id: 17},
  { menu_id: 7, item_id: 18},
  { menu_id: 7, item_id: 19}
])

# 1-9
Ingredient.create([
  { provider_id: 1, name: 'Cheese'},
  { provider_id: 1, name: 'Pepperoni'},
  { provider_id: 1, name: 'Italian Sausage'},
  { provider_id: 1, name: 'Sliced Sausage'},
  { provider_id: 1, name: 'Green Peppers'},
  { provider_id: 1, name: 'Black Olives'},
  { provider_id: 1, name: 'Pineapple'},
  { provider_id: 1, name: 'Mushrooms'},
  { provider_id: 1, name: 'Onions'}
])



# PizzaHut
# 2
Provider.create([ name: 'PizzaHut', password: '123456', phone: '302130343500', email: 'pizzahut@fakeemail.gr'])
# 5-8
Office.create([ provider_id: 2, address: '46A El. Venizelou str', city: 'Athens', country_code: 'GR', phone: '302130048400', email: 'pizzahut1@fakeemail.gr'])
Office.create([ provider_id: 2, address: '228 Thivon str', city: 'Athens', country_code: 'GR', phone: '302103346375', email: 'pizzahut2@fakeemail.gr'])
Office.create([ provider_id: 2, address: '44 Marathonos Avenue', city: 'Athens', country_code: 'GR', phone: '302104562850', email: 'pizzahut3@fakeemail.gr'])
Office.create([ provider_id: 2, address: '175 Alexandras Avenue', city: 'Athens', country_code: 'GR', phone: '302105222706', email: 'pizzahut4@fakeemail.gr'])
# 8-14
Menu.create([{ provider_id: 2, name: 'Pizzas', photo: 'pizza.jpg'}])
Menu.create([{ provider_id: 2, name: 'Pasta', photo: 'pasta.jpg'}])
Menu.create([{ provider_id: 2, name: 'Starters', photo: 'sandwich.jpg'}])
Menu.create([{ provider_id: 2, name: 'Meat Balls - Chicken', photo: 'chicken.jpg'}])
Menu.create([{ provider_id: 2, name: 'Salads', photo: 'bread.jpg'}])
Menu.create([{ provider_id: 2, name: 'Drinks', photo: 'drinks.jpg'}])
Menu.create([{ provider_id: 2, name: 'Deserts', photo: 'dessert.jpg'}])

# 20-44
# pizza
Item.create([{ provider_id: 2, name: 'Pepperoni Lover', price: 7.99, description: 'Three layers of mozzarella cheese'}])
Item.create([{ provider_id: 2, name: 'Queen Margherita', price: 8.99, description: 'The famous surprise combination Margherita by 4DThePizza, now for a whole pizza with the crust of your choice. Mozzarella, special tomato sauce, gruyere, cream and thyme.'}])
# pasta
Item.create([{ provider_id: 2, name: 'Carbonara', price: 7.30, description: 'Penne with Carbonara sauce, crispy bacon, gouda cheese and rich mozzarella and gruyere topping'}])
# starters
Item.create([{ provider_id: 2, name: 'Cheese Bread', price: 3.4, description: 'Warm breadsticks made of delicious Pizza Hut dough and melted Mozzarella cheese.Served with Chilli Sauce.'}])
Item.create([{ provider_id: 2, name: 'Onion Rings', price: 4.9, description: 'Fried onion rings with blue cheese dip.'}])
Item.create([{ provider_id: 2, name: 'Potato Wedges', price: 4.95, description: 'Potato wedges with ketchup tomato sauce.'}])
Item.create([{ provider_id: 2, name: 'BBQ Chicken Wings', price: 5.45, description: 'BBQ chicken wings with BBQ sauce.'}])
# chicken
Item.create([{ provider_id: 2, name: 'Meat Balls', price: 9.25, description: 'Delicious and juicy meat balls, made from beef and pork. Served with fries!'}])
Item.create([{ provider_id: 2, name: 'Chicken with melted mozzarella and gruyere', price: 10.35, description: 'Juicy grilled chicken fillet, with a rich layer of melted mozzarella and gruyere. Served with fries.'}])
# salads
Item.create([{ provider_id: 2, name: 'Caesar\'s salad with Chicken ', price: 5.45, description: 'Salad with iceberg, lettuce, sweetcorn, parmesan cheese, croutons, chicken and Vinaigrette dressing'}])
Item.create([{ provider_id: 2, name: 'New Chef with Bacon', price: 3.41, description: 'With a variety of fresh vegetables (lettuce, lolo biondo, lolo rosso and radicio), fresh tomato, crunch crouton, gouda cheese, crispy bacon, egg and 1000 islands dressing'}])
Item.create([{ provider_id: 2, name: 'Tuna Salad', price: 4.11, description: 'Lettuce, iceberg, fresh tomatoes, cucumber, sweetcorn, tuna fish and Vinaigrette dressing.'}])
Item.create([{ provider_id: 2, name: 'Spinach & Rocket Salad ', price: 0.69, description: 'With rocket, baby spinach, sun - dried tomatoes, crouton, bacon, fresh mushrooms, extra virgin olive oil and balsamico'}])
# drinks
Item.create([{ provider_id: 2, name: 'Coca Cola 330ml', price: 0.79}])
Item.create([{ provider_id: 2, name: 'Fanta 330ml', price: 0.79}])
Item.create([{ provider_id: 2, name: 'Amita Fun 200ml', price: 0.59}])
Item.create([{ provider_id: 2, name: 'Sprite 330ml', price: 0.79}])
# deserts
Item.create([{ provider_id: 2, name: 'Haagen Dazs - Belgian Chocolate ', price: 8.80, description: 'Haagen Dazs - Belgian Chocolate 500ml'}])
Item.create([{ provider_id: 2, name: 'Haagen Dazs - Macademia Nut Brittle', price: 8.99, description: 'Haagen Dazs - Macademia Nut Brittle 500 ml'}])
Item.create([{ provider_id: 2, name: 'Haagen Dazs - Pralines & Cream', price: 8.99, description: 'Haagen Dazs - Pralines & Cream 500 ml'}])
Item.create([{ provider_id: 2, name: 'Haagen Dazs - Vanilla', price: 8.99, description: 'Haagen Dazs - Vanilla 500 ml'}])
Item.create([{ provider_id: 2, name: 'Haagen Dazs - Cookies & Cream', price: 8.99, description: 'Haagen Dazs - Cookies & Cream 500 ml'}])
Item.create([{ provider_id: 2, name: 'Haagen Dazs - Choc Choc Chip', price: 8.99, description: 'Haagen Dazs - Choc Choc Chip 500 ml'}])
Item.create([{ provider_id: 2, name: 'Haagen Dazs - Stawberry CheeseCake', price: 8.99, description: 'Haagen Dazs - Stawberry CheeseCake 500 ml'}])
Item.create([{ provider_id: 2, name: 'Double Chocolate Lovin\' Spoon', price: 8.99, description: 'Super chocolate cake.'}])

# 20-44
Categorization.create([
  { menu_id: 8, item_id: 20},
  { menu_id: 8, item_id: 21},
  { menu_id: 9, item_id: 22},
  { menu_id: 10, item_id: 23},
  { menu_id: 10, item_id: 24},
  { menu_id: 10, item_id: 25},
  { menu_id: 10, item_id: 26},
  { menu_id: 11, item_id: 27},
  { menu_id: 11, item_id: 28},
  { menu_id: 12, item_id: 29},
  { menu_id: 12, item_id: 30},
  { menu_id: 12, item_id: 31},
  { menu_id: 12, item_id: 32},
  { menu_id: 13, item_id: 33},
  { menu_id: 13, item_id: 34},
  { menu_id: 13, item_id: 35},
  { menu_id: 13, item_id: 36},
  { menu_id: 14, item_id: 37},
  { menu_id: 14, item_id: 38},
  { menu_id: 14, item_id: 39},
  { menu_id: 14, item_id: 40},
  { menu_id: 14, item_id: 41},
  { menu_id: 14, item_id: 42},
  { menu_id: 14, item_id: 43},
  { menu_id: 14, item_id: 44}
])

# 1-9
Ingredient.create([
  { provider_id: 1, name: 'Cheese'},
  { provider_id: 1, name: 'Pepperoni'},
  { provider_id: 1, name: 'Italian Sausage'},
  { provider_id: 1, name: 'Sliced Sausage'},
  { provider_id: 1, name: 'Green Peppers'},
  { provider_id: 1, name: 'Black Olives'},
  { provider_id: 1, name: 'Pineapple'},
  { provider_id: 1, name: 'Mushrooms'},
  { provider_id: 1, name: 'Onions'}
])

# end of PROVIDERS

# 1-5
IngredientCategorization.create([
  { ingredient_id: 1, item_id: 1},
  { ingredient_id: 2, item_id: 2},
  { ingredient_id: 1, item_id: 1},
  { ingredient_id: 2, item_id: 2},
  { ingredient_id: 3, item_id: 3}
])

Customer.create([
  { email: 'customer@fakeemail.com', password: '123456', first_name: 'Giedrius', last_name: 'Rimkus', phone: '1234321'},
  { email: 'info@giedriusr.lt', password: '123456', first_name: 'Giedriukas', last_name: 'Rimkiukas', phone: '0987632'},
  { email: 'diusha13@gmail.com', password: '123456', first_name: 'Andreas', last_name: 'Taranuta', phone: '4234345'}
])

CustomerDeliveryAddress.create([
  { customer_id: 1, country_code: 'GR', address: 'Allikarnassou 2', city: 'Athens', post_code: '17122'},
  { customer_id: 1, country_code: 'GR', address: 'Saripoulou 10-8', city: 'Athens', post_code: '17671'},
  { customer_id: 2, country_code: 'GR', address: 'Faliro', city: 'Athens'}
])

Employee.create([
  { first_name: 'Employee', last_name: 'Employeeee', email: 'employee@fakeemail.com', password: '123456'},
  { first_name: 'Admin', last_name: 'Demo', email: 'employee2@fakeemail.com', password: '123456'}
])