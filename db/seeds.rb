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
								date_start: '12/01/2016', 
								date_end: '31/01/2016', 
								condition: '')

Product.create(title: 'Prod2', 
								description: 'Description du prod2', 
								price: '16.50', 
								renter: 'dista', 
								date_start: '12/03/2016', 
								date_end: '31/03/2016', 
								condition: '')

Question.create(question: 'est-ce que ca marche ?',
								asker: 'user1',
								answer: 'Oui bien sûr que ça marche !',
								email: 'user1@gmail.com',
								date: '12/12/2012 05:12:40',
								title: 'Test question',
								product_id: 1)

Question.create(question: 'Possible de l\'avoir en blanc ?',
								asker: 'user2',
								email: 'user2@gmail.com',
								date: '12/12/2012 08:12:40',
								title: 'Question2',
								product_id: 1)

Question.create(question: 'Atchoum ?',
								asker: 'user3',
								email: 'user3@gmail.com',
								date: '12/12/2012 10:12:40',
								title: 'Question 3',
								product_id: 2)

Tenant.create(lastname: 'Daniel',
      				firstname: 'Dupond',
      				address: 'Salut 18',
      				city: 'Les prés',
      				npa: '2654',
      				email: 'coucou@gmail.com',
      				date_start: '12/04/2016',
      				date_end: '14/04/2016',
      				utilisation: 'On verra bien',
      				product_id: 2)

Tenant.create(lastname: 'Daniel',
      				firstname: 'Dupont',
      				address: 'Salut 18',
      				city: 'Les prés',
      				npa: '2654',
      				email: 'hello@gmail.com',
      				date_start: '15/03/2016',
      				date_end: '18/03/2016',
      				utilisation: 'On verra bien aussi, pas pressé',
      				product_id: 2)