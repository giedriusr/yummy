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
truncate('addresses')
truncate('employees')
truncate('carts')
truncate('cart_items')
truncate('order_items')
truncate('orders')
truncate('order_item_ingredients')

# seeding with dummy data
# with ID's it doesn't work :(

# PROVIDERS and their related stuff

# Domino Pizza
# 1
domino = Provider.create(:name => 'Domino Pizza', :password => '123456',
                           :phone => '302130048400', :email => 'domino@fakeemail.gr')
# 1-4
domino.offices.create(:address => 'Saripolou 10', :city => 'Athens',
                        :country_code => 'GR', :phone => '302130048400',
                        :email => 'domino1@fakeemail.gr', :post_code => '17671',
                        :description => 'office description', :name => 'domino 1st office')
domino.offices.create(:address => 'Aristonikou 1', :city => 'Athens',
                        :country_code => 'GR', :phone => '302109246375',
                        :email => 'domino2@fakeemail.gr', :post_code => '11636',
                        :description => 'office description', :name => 'domino 2nd office')
domino.offices.create(:address => 'Katechaki 27', :city => 'Athens',
                        :country_code => 'GR', :phone => '302106962850',
                        :email => 'domino3@fakeemail.gr', :post_code => '11525',
                        :description => 'office description', :name => 'domino 3rd office')
domino.offices.create(:address => '7 KAPNIKAREAS', :city => 'Athens',
                        :country_code => 'GR', :phone => '302103222706',
                        :email => 'domino4@fakeemail.gr', :post_code => '10556',
                        :description => 'office description', :name => 'domino 4th office')
# 1-7
domino.menus.create(:name => 'Pizzas', :photo => 'pizza.jpg')
domino.menus.create(:name => 'Breadbowl Pasta', :photo => 'pasta.jpg')
domino.menus.create(:name => 'Oven Baked Sandwiches', :photo => 'sandwich.jpg')
domino.menus.create(:name => 'Chicken', :photo => 'chicken.jpg')
domino.menus.create(:name => 'Breads', :photo => 'bread.jpg')
domino.menus.create(:name => 'Drinks', :photo => 'drinks.jpg')
domino.menus.create(:name => 'Deserts', :photo => 'dessert.jpg')

# 1-19
# pizza
domino.items.create(:name => 'Hand Tossed', :price => 10, :description => 'Our garlic-seasoned crust with a rich, buttery taste.')
domino.items.create(:name => 'Deep Dish', :price => 12, :description => 'Extra thick to support potential topping overload.')
# pasta
domino.items.create(:name => 'Chicken Alfredo', :price => 7, :description => 'Grilled 100% all white meat chicken and Alfredo sauce baked to a creamy goodness with penne pasta.')
# sandwich
domino.items.create(:name => 'Italian Sausage and Peppers', :price => 3.4, :description => 'Sliced Italian sausage, roasted red peppers, green peppers, banana peppers, onions, provolone cheese and tomato basil marinara. All on our artisan Italian bread and baked to a golden brown.')
domino.items.create(:name => 'Buffalo Chicken', :price => 4.4, :description => 'Tender cuts of seasoned all white meat chicken breast, creamy blue cheese, onions, hot sauce, cheddar & provolone cheese. All on our artisan Italian bread and baked to a perfect golden brown.')
domino.items.create(:name => 'Chicken Habanero', :price => 2.95, :description => 'A SWEET & SPICY medley, made with all white meat chicken breast, pineapple, jalapenos, sweet mango habanero sauce, provolone & cheddar cheese. On artisan Italian bread & baked to a golden brown.')
domino.items.create(:name => 'Chicken Bacon Ranch', :price => 6.95, :description => 'Tender cuts of Seasoned All White Meat Chicken Breast, Smoked Bacon, Creamy Ranch, and Premium Provolone Cheese all loaded on an Artisan Italian Bread and baked to a perfect golden brown.')
# chicken
domino.items.create(:name => 'Boneless Chicken', :price => 11.25, :description => 'Our boneless chicken is lightly breaded with savory herbs, made with 100% white breast meat. Customize with your choice of dipping sauce: Kicker Hot Sauce, Sweet Mango Habanero, BBQ, Ranch or Blue Cheese.')
domino.items.create(:name => 'Chicken Wings', :price => 13.35, :description => 'Our chicken wings are now tastier than ever. Sauced with your choice of Hot, Sweet Mango Habanero or BBQ Sauce.')
# bread
domino.items.create(:name => 'Stuffed Cheesy Bread', :price => 1.45, :description => 'Oven baked breadsticks stuffed with cheese, and covered in a blend of cheese made with 100% Mozzarella and Cheddar Cheese. Seasoned with a sprinkling of garlic, parsley and Romano cheese. 8 pieces of delicious, cheesy indulgence! Add Marinara or your favorite dipping cup for an additional charge.')
domino.items.create(:name => 'Stuffed Cheesy Bread with Spinach & Feta', :price => 3.41, :description => 'Oven baked breadsticks stuffed with cheese, fresh spinach and Feta cheese - covered in a blend of cheese made with 100% Mozzarella and Cheddar Cheese. Seasoned with a sprinkling of garlic, parsley and Romano cheese. Add Marinara or your favorite dipping cup for an additional charge.')
domino.items.create(:name => 'Stuffed Cheesy Bread with Bacon & Jalapeno', :price => 4.11, :description => 'Oven baked breadsticks stuffed with cheese, smoked bacon and jalapeno peppers - covered in a blend of cheese made with 100% Mozzarella and Cheddar Cheese. Seasoned with a sprinkling of garlic, parsley and Romano cheese. Add Marinara or your favorite dipping cup for an additional charge.')
domino.items.create(:name => 'Breadsticks', :price => 0.69, :description => 'Oven baked breadsticks sprinkled with a flavorful blend of garlic, Romano cheese and parsley. Golden brown, warm and delicious - breadsticks are served with marinara sauce for dipping. Or, try them with garlic dipping sauce or ranch. A tasty addition to your meal.')
# drinks
domino.items.create(:name => 'Coke', :price => 0.79, :description => 'The authentic cola sensation that is a refreshing part of sharing life\'s enjoyable moments')
domino.items.create(:name => 'Coke Zero', :price => 0.79, :description => 'Real Coca-Cola taste with zero calories')
domino.items.create(:name => 'Diet Coke', :price => 0.79, :description => 'Beautifully balanced adult cola taste in a no calorie beverage')
domino.items.create(:name => 'Sprite', :price => 0.89, :description => 'Unique Lymon (lemon-lime) flavor, clear, clean and crisp with no caffeine.')
# deserts
domino.items.create(:name => 'Chocolate Lava Crunch Cakes', :price => 3.80, :description => 'Oven baked chocolate cakes, crunchy on the outside with molten chocolate on the inside.')
domino.items.create(:name => 'Cinna Stix', :price => 2.30, :description => 'Sprinkled with cinnamon and sugar, then baked to perfection. Served with sweet icing.')

# 1-19
c = Categorization.new; c.menu_id = 1; c.item_id = 1; c.save
c = Categorization.new; c.menu_id = 1; c.item_id = 2; c.save
c = Categorization.new; c.menu_id = 2; c.item_id = 3; c.save
c = Categorization.new; c.menu_id = 3; c.item_id = 4; c.save
c = Categorization.new; c.menu_id = 3; c.item_id = 5; c.save
c = Categorization.new; c.menu_id = 3; c.item_id = 6; c.save
c = Categorization.new; c.menu_id = 3; c.item_id = 7; c.save
c = Categorization.new; c.menu_id = 4; c.item_id = 8; c.save
c = Categorization.new; c.menu_id = 4; c.item_id = 9; c.save
c = Categorization.new; c.menu_id = 5; c.item_id = 10; c.save
c = Categorization.new; c.menu_id = 5; c.item_id = 11; c.save
c = Categorization.new; c.menu_id = 5; c.item_id = 12; c.save
c = Categorization.new; c.menu_id = 5; c.item_id = 13; c.save
c = Categorization.new; c.menu_id = 6; c.item_id = 14; c.save
c = Categorization.new; c.menu_id = 6; c.item_id = 15; c.save
c = Categorization.new; c.menu_id = 6; c.item_id = 16; c.save
c = Categorization.new; c.menu_id = 6; c.item_id = 17; c.save
c = Categorization.new; c.menu_id = 7; c.item_id = 18; c.save
c = Categorization.new; c.menu_id = 7; c.item_id = 19; c.save


# 1-9
domino.ingredients.create(:name => 'Cheese')
domino.ingredients.create(:name => 'Pepperoni')
domino.ingredients.create(:name => 'Italian Sausage')
domino.ingredients.create(:name => 'Sliced Sausage')
domino.ingredients.create(:name => 'Green Peppers')
domino.ingredients.create(:name => 'Black Olives')
domino.ingredients.create(:name => 'Pineapple')
domino.ingredients.create(:name => 'Mushrooms')
domino.ingredients.create(:name => 'Onions')

# 1-2
c = IngredientCategorization.new; c.ingredient_id = 1; c.item_id = 1; c.save
c = IngredientCategorization.new; c.ingredient_id = 2; c.item_id = 1; c.save


# PizzaHut
# 2
pizzahut = Provider.create(:name => 'PizzaHut', :password => '123456',
                           :phone => '302130343500', :email => 'pizzahut@fakeemail.gr')
# 5-8
pizzahut.offices.create(:address => '46A El. Venizelou str', :city => 'Athens',
                        :country_code => 'GR', :phone => '302130048400',
                        :email => 'pizzahut1@fakeemail.gr', :post_code => '10341',
                        :description => 'office description', :name => 'pizzahut 1st office')
pizzahut.offices.create(:address => '228 Thivon str', :city => 'Athens',
                        :country_code => 'GR', :phone => '302103346375',
                        :email => 'pizzahut2@fakeemail.gr', :post_code => '10341',
                        :description => 'office description', :name => 'pizzahut 2nd office')
pizzahut.offices.create(:address => '44 Marathonos Avenue', :city => 'Athens',
                        :country_code => 'GR', :phone => '302104562850',
                        :email => 'pizzahut3@fakeemail.gr', :post_code => '10341',
                        :description => 'office description', :name => 'pizzahut 3rd office')
pizzahut.offices.create(:address => '175 Alexandras Avenue', :city => 'Athens',
                        :country_code => 'GR', :phone => '302105222706',
                        :email => 'pizzahut4@fakeemail.gr', :post_code => '10341',
                        :description => 'office description', :name => 'pizzahut 4th office')
pizzahut.offices.create(:address => 'Leoforos Syngrou 241', :city => 'Athens',
                        :country_code => 'GR', :phone => '302105222706',
                        :email => 'pizzahut5@fakeemail.gr', :post_code => '10341',
                        :description => 'office description', :name => 'pizzahut 5th office')
# 8-14
pizzahut.menus.create(:name => 'Pizzas', :photo => 'pizza.jpg')
pizzahut.menus.create(:name => 'Pasta', :photo => 'pasta.jpg')
pizzahut.menus.create(:name => 'Starters', :photo => 'sandwich.jpg')
pizzahut.menus.create(:name => 'Meat Balls - Chicken', :photo => 'chicken.jpg')
pizzahut.menus.create(:name => 'Salads', :photo => 'bread.jpg')
pizzahut.menus.create(:name => 'Drinks', :photo => 'drinks.jpg')
pizzahut.menus.create(:name => 'Deserts', :photo => 'dessert.jpg')

# 20-44
# pizza
domino.items.create(:name => 'Hand Tossed', :price => 10, :description => 'Our garlic-seasoned crust with a rich, buttery taste.')

pizzahut.items.create(:name => 'Pepperoni Lover', :price => 7.99, :description => 'Three layers of mozzarella cheese')
pizzahut.items.create(:name => 'Queen Margherita', :price => 8.99, :description => 'The famous surprise combination Margherita by 4DThePizza, now for a whole pizza with the crust of your choice. Mozzarella, special tomato sauce, gruyere, cream and thyme.')
# pasta
pizzahut.items.create(:name => 'Carbonara', :price => 7.30, :description => 'Penne with Carbonara sauce, crispy bacon, gouda cheese and rich mozzarella and gruyere topping')
# starters
pizzahut.items.create(:name => 'Cheese Bread', :price => 3.4, :description => 'Warm breadsticks made of delicious Pizza Hut dough and melted Mozzarella cheese.Served with Chilli Sauce.')
pizzahut.items.create(:name => 'Onion Rings', :price => 4.9, :description => 'Fried onion rings with blue cheese dip.')
pizzahut.items.create(:name => 'Potato Wedges', :price => 4.95, :description => 'Potato wedges with ketchup tomato sauce.')
pizzahut.items.create(:name => 'BBQ Chicken Wings', :price => 5.45, :description => 'BBQ chicken wings with BBQ sauce.')
# chicken
pizzahut.items.create(:name => 'Meat Balls', :price => 9.25, :description => 'Delicious and juicy meat balls, made from beef and pork. Served with fries!')
pizzahut.items.create(:name => 'Chicken with melted mozzarella and gruyere', :price => 10.35, :description => 'Juicy grilled chicken fillet, with a rich layer of melted mozzarella and gruyere. Served with fries.')
# salads
pizzahut.items.create(:name => 'Caesar\'s salad with Chicken ', :price => 5.45, :description => 'Salad with iceberg, lettuce, sweetcorn, parmesan cheese, croutons, chicken and Vinaigrette dressing')
pizzahut.items.create(:name => 'New Chef with Bacon', :price => 3.41, :description => 'With a variety of fresh vegetables (lettuce, lolo biondo, lolo rosso and radicio), fresh tomato, crunch crouton, gouda cheese, crispy bacon, egg and 1000 islands dressing')
pizzahut.items.create(:name => 'Tuna Salad', :price => 4.11, :description => 'Lettuce, iceberg, fresh tomatoes, cucumber, sweetcorn, tuna fish and Vinaigrette dressing.')
pizzahut.items.create(:name => 'Spinach & Rocket Salad ', :price => 0.69, :description => 'With rocket, baby spinach, sun - dried tomatoes, crouton, bacon, fresh mushrooms, extra virgin olive oil and balsamico')
# drinks
pizzahut.items.create(:name => 'Coca Cola 330ml', :price => 0.79)
pizzahut.items.create(:name => 'Fanta 330ml', :price => 0.79)
pizzahut.items.create(:name => 'Amita Fun 200ml', :price => 0.59)
pizzahut.items.create(:name => 'Sprite 330ml', :price => 0.79)
# deserts
pizzahut.items.create(:name => 'Haagen Dazs - Belgian Chocolate ', :price => 8.80, :description => 'Haagen Dazs - Belgian Chocolate 500ml')
pizzahut.items.create(:name => 'Haagen Dazs - Macademia Nut Brittle', :price => 8.99, :description => 'Haagen Dazs - Macademia Nut Brittle 500 ml')
pizzahut.items.create(:name => 'Haagen Dazs - Pralines & Cream', :price => 8.99, :description => 'Haagen Dazs - Pralines & Cream 500 ml')
pizzahut.items.create(:name => 'Haagen Dazs - Vanilla', :price => 8.99, :description => 'Haagen Dazs - Vanilla 500 ml')
pizzahut.items.create(:name => 'Haagen Dazs - Cookies & Cream', :price => 8.99, :description => 'Haagen Dazs - Cookies & Cream 500 ml')
pizzahut.items.create(:name => 'Haagen Dazs - Choc Choc Chip', :price => 8.99, :description => 'Haagen Dazs - Choc Choc Chip 500 ml')
pizzahut.items.create(:name => 'Haagen Dazs - Stawberry CheeseCake', :price => 8.99, :description => 'Haagen Dazs - Stawberry CheeseCake 500 ml')
pizzahut.items.create(:name => 'Double Chocolate Lovin\' Spoon', :price => 8.99, :description => 'Super chocolate cake.')

# 20-44
c = Categorization.new; c.menu_id = 8; c.item_id = 20; c.save
c = Categorization.new; c.menu_id = 8; c.item_id = 21; c.save
c = Categorization.new; c.menu_id = 9; c.item_id = 22; c.save
c = Categorization.new; c.menu_id = 10; c.item_id = 23; c.save
c = Categorization.new; c.menu_id = 10; c.item_id = 24; c.save
c = Categorization.new; c.menu_id = 10; c.item_id = 25; c.save
c = Categorization.new; c.menu_id = 10; c.item_id = 26; c.save
c = Categorization.new; c.menu_id = 11; c.item_id = 27; c.save
c = Categorization.new; c.menu_id = 11; c.item_id = 28; c.save
c = Categorization.new; c.menu_id = 12; c.item_id = 29; c.save
c = Categorization.new; c.menu_id = 12; c.item_id = 30; c.save
c = Categorization.new; c.menu_id = 12; c.item_id = 31; c.save
c = Categorization.new; c.menu_id = 12; c.item_id = 32; c.save
c = Categorization.new; c.menu_id = 13; c.item_id = 33; c.save
c = Categorization.new; c.menu_id = 13; c.item_id = 34; c.save
c = Categorization.new; c.menu_id = 13; c.item_id = 35; c.save
c = Categorization.new; c.menu_id = 13; c.item_id = 36; c.save
c = Categorization.new; c.menu_id = 14; c.item_id = 37; c.save
c = Categorization.new; c.menu_id = 14; c.item_id = 38; c.save
c = Categorization.new; c.menu_id = 14; c.item_id = 39; c.save
c = Categorization.new; c.menu_id = 14; c.item_id = 40; c.save
c = Categorization.new; c.menu_id = 14; c.item_id = 41; c.save
c = Categorization.new; c.menu_id = 14; c.item_id = 42; c.save
c = Categorization.new; c.menu_id = 14; c.item_id = 43; c.save
c = Categorization.new; c.menu_id = 14; c.item_id = 44; c.save

# 1-9
pizzahut.ingredients.create(:name => 'Cheese')
pizzahut.ingredients.create(:name => 'Pepperoni')
pizzahut.ingredients.create(:name => 'Italian Sausage')
pizzahut.ingredients.create(:name => 'Sliced Sausage')
pizzahut.ingredients.create(:name => 'Green Peppers')
pizzahut.ingredients.create(:name => 'Black Olives')
pizzahut.ingredients.create(:name => 'Pineapple')
pizzahut.ingredients.create(:name => 'Mushrooms')
pizzahut.ingredients.create(:name => 'Onions')

# end of PROVIDERS


customer = Customer.create(:email => 'customer@fakeemail.com', :password => '123456',
                           :first_name => 'Giedrius', :last_name => 'Rimkus',
                           :phone => '1234321')

customer.addresses.create(:country_code => 'GR',
                                            :address => 'Allikarnassou 2',
                                            :city => 'Athens',
                                            :post_code => '17122')
customer.addresses.create(:country_code => 'GR',
                                            :address => 'Saripoulou 10-8',
                                            :city => 'Athens',
                                            :post_code => '17671')

Employee.create([
  { first_name: 'Employee', last_name: 'Employeeee', email: 'employee@fakeemail.com', password: '123456'},
  { first_name: 'Admin', last_name: 'Demo', email: 'employee2@fakeemail.com', password: '123456'}
])