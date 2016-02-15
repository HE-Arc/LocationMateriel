# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.create(title: 'Test', 
								description: 'Description du test', 
								price: '19.50', 
								renter: 'dista', 
								date_start: '12/12/2016', 
								date_end: '31/12/2016', 
								condition: '')

Product.create(title: 'Prod2', 
								description: 'Description du prod2', 
								price: '16.50', 
								renter: 'dista', 
								date_start: '12/12/2016', 
								date_end: '31/12/2016', 
								condition: '')

Question.create(question: 'est-ce que ca marche ?',
								asker: 'user1',
								date: '12/12/2012 05:12:40',
								title: 'Test question',
								product_id: 1)

Question.create(question: 'Possible de l\'avoir en blanc ?',
								asker: 'user2',
								date: '12/12/2012 08:12:40',
								title: 'Question2',
								product_id: 1)

Question.create(question: 'Atchoum ?',
								asker: 'user3',
								date: '12/12/2012 10:12:40',
								title: 'Question 3',
								product_id: 2)