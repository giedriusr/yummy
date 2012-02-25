# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Provider.create([
  { name: 'Domino', user_name: 'domino', password: '123456', phone: '123456789', email: 'domino@email.gr'},
  { name: 'Pizza Hat', user_name: 'pizzahat', password: '123321', phone: '1364332344', email: 'pizzahat@email.gr'},
  { name: 'La Pasteria', user_name: 'lapasteria', password: '123asw', phone: '12345345', email: 'lapasteria@email.gr'},
  { name: 'Grill Academy', user_name: 'grillac', password: '123sde', phone: '12345643', email: 'grillac@email.gr'},
  { name: 'Loukoumades', user_name: 'loukoma', password: '123vbg', phone: '123433565', email: 'loukoma@email.gr'}
])

Office.create([
  { provider_id: '1', name: 'Domino Nea smyrni', address: 'nea smyrni', city: 'Athens', country_code: 'GR', email: 'neasmyrnidomino@email.gr'},
  { provider_id: '1', name: 'Domino Kallithea', address: 'kallithea', city: 'Athens', country_code: 'GR', email: 'kallitheadomino@email.gr'},
  { provider_id: '2', name: 'PizzaHat Kallithea', address: 'Pireauas', city: 'Piraeus', country_code: 'GR', email: 'pirpizza@email.gr'}
  ])
