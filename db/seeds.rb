# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

sunny = User.create(email: 'aurangzaib.danial@gmail.com', password: 'khan1234')
avi = User.create(email: 'avi@fs.com', password: 'avi1234')

post_1 = Post.create(title: 'my first post', body: 'this is the body')
post_1.shared_posts.create(user: sunny, permission: 0)
post_1.shared_posts.create(user: avi, permission: 10)


post_2 = Post.create(title: 'Flatiron school rocks', body: 'We teach Ruby, because it\'s the best')
post_2.shared_posts.create(user: avi, permission: 0)
post_2.shared_posts.create(user: sunny, permission: 100)
