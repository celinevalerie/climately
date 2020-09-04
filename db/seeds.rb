# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

Message.delete_all
Friendship.delete_all
UserGroup.delete_all
Group.delete_all
Chatroom.delete_all
Challenge.delete_all
User.delete_all

@challenge = Challenge.new(
  name: 'Go Vegetarian', 
  description: 'Environmental vegetarianism is the practice of vegetarianism when motivated by the desire to create a sustainable diet that avoids the negative environmental impact of meat production. Livestock as a whole is estimated to be responsible for around 18% of global greenhouse gas emissions.',
  category: 'Food',
  default_difficulty: 8,
  default_impact: 7
)

file = URI.open('https://res.cloudinary.com/dpdwv3yz1/image/upload/v1598886172/Component_5_dybpya.png')
@challenge.photo.attach(io: file, filename: 'Component_5_dybpya.png', content_type: 'image/png')

@challenge.save

@chatroom = Chatroom.create

@group = Group.new(
  completed: false,
  difficulty: 10,
  impact: 8,
  duration: 21, 
  exceptions: 2, 
  points: 626, 
  challenge: @challenge,
  chatroom_id: @chatroom.id
  )
@group.save

@chatroom = Chatroom.create

@group1 = Group.new(
  completed: false,
  difficulty: 10,
  impact: 8,
  duration: 21, 
  exceptions: 2, 
  points: 626, 
  challenge: @challenge,
  chatroom_id: @chatroom.id
  )
@group.save

@user1 = User.new(
  email: 'samira.eilinger@climately.io',
  password: '123456',
  first_name: 'Samira',
  last_name: 'Eilinger',
  user_name: 'samirajil',
  points: 200)
  file = URI.open('https://res.cloudinary.com/doewieec6/image/upload/v1598440482/belydzaow0mz6nxbqfztx7p7a4lw.jpg')
  @user1.photo.attach(io: file, filename: 'belydzaow0mz6nxbqfztx7p7a4lw.jpg', content_type: 'image/jpg')
@user1.save


@user2 = User.new(
  email: 'celine.stalder@climately.io',
  password: '123456',
  first_name: 'Céline',
  last_name: 'Stalder',
  user_name: 'celinevalerie',
  points: 400)
  file = URI.open('https://res.cloudinary.com/doewieec6/image/upload/v1598440482/belydzaow0mz6nxbqfztx7p7a4lw.jpg')
  @user2.photo.attach(io: file, filename: 'belydzaow0mz6nxbqfztx7p7a4lw.jpg', content_type: 'image/jpg')
@user2.save

@users_group = UserGroup.new(
  participating: true,
  group: @group,
  user: @user1)
@users_group.save

@users_group = UserGroup.new(
  participating: true,
  group: @group1,
  user: @user1)
@users_group.save

@users_group = UserGroup.new(
  participating: true,
  group: @group,
  user: @user2)
@users_group.save

@friendship = Friendship.new(
  user: @user1, 
  friend: @user2
)
@friendship.save

@friendship = Friendship.new(
  user: @user2, 
  friend: @user1
)
@friendship.save


@challenge = Challenge.new(
  name: 'Plastic Bottles', 
  description: "Almost all plastic is derived from materials (like ethylene and propylene) made from fossil fuels (mostly oil and gas). The process of extracting and transporting those fuels, then manufacturing plastic creates billions of tonnes of greenhouse gases. For example, 4% of the world's annual petroleum production is diverted to making plastic, and another 4% gets burned in the refining process. But how we manage all the plastic that then goes into circulation is equally troubling. Of the almost 3 million tonnes of plastic that Australia produces each year, 95% is discarded after a single use. Less than 12% is recycled, which leaves a staggering amount to be disposed of - in landfills or incinerated.",
  category: 'Waste',
  default_difficulty: 7,
  default_impact: 7
  )

file = URI.open('https://res.cloudinary.com/doewieec6/image/upload/v1598440482/belydzaow0mz6nxbqfztx7p7a4lw.jpg')
@challenge.photo.attach(io: file, filename: 'belydzaow0mz6nxbqfztx7p7a4lw.jpg', content_type: 'image/jpg')
@challenge.save

@chatroom = Chatroom.create

@group = Group.new(
  completed: false,
  difficulty: 7,
  impact: 5,
  duration: 14, 
  exceptions: 2, 
  points: 326, 
  challenge: @challenge,
  chatroom: @chatroom ) 
@group.save

@user1 = User.new(
  email: 'mariana.toscana@climately.io',
  password: '123456',
  first_name: 'Mariana',
  last_name: 'Toscano',
  user_name: 'mariana',
  points: 100)
  file = URI.open('https://res.cloudinary.com/doewieec6/image/upload/v1598440482/belydzaow0mz6nxbqfztx7p7a4lw.jpg')
  @user1.photo.attach(io: file, filename: 'belydzaow0mz6nxbqfztx7p7a4lw.jpg', content_type: 'image/jpg')
@user1.save

@user2 = User.new(
  email: 'lena.schlage@climately.io',
  password: '123456',
  first_name: 'Lena',
  last_name: 'Schlage',
  user_name: 'lenajohanna',
  points: 600)
  file = URI.open('https://res.cloudinary.com/doewieec6/image/upload/v1598440482/belydzaow0mz6nxbqfztx7p7a4lw.jpg')
  @user2.photo.attach(io: file, filename: 'belydzaow0mz6nxbqfztx7p7a4lw.jpg', content_type: 'image/jpg')
@user2.save

@users_group = UserGroup.new(
  participating: false,
  group: @group,
  user: @user1)
@users_group.save

@users_group = UserGroup.new(
  participating: true,
  group: @group,
  user: @user2)
@users_group.save

@friendship = Friendship.new(
  user: @user1, 
  friend: @user2
)

@friendship = Friendship.new(
  user: @user2, 
  friend: @user1
)

@challenge = Challenge.new(
  name: 'No Cars', 
  description: 'Carbon emissions include a number of different chemicals and particulates that are produced when fuel is burned in an engine. Some of the major substances found in a car’s exhaust include carbon dioxide, ozone, and carbon monoxide. Other chemicals often found in exhaust gasses include benzene and nitrogen oxides. Many of these chemicals serve an important purpose in different parts of the atmosphere, but they can have bad consequences when human beings inhale them directly.',
  category: 'Mobility',
  default_difficulty: 8,
  default_impact: 6
  )
  file = URI.open('https://res.cloudinary.com/dpdwv3yz1/image/upload/v1598886172/Component_8_ldexne.png')
  @challenge.photo.attach(io: file, filename: 'Component_8_ldexne.png', content_type: 'image/png')
@challenge.save

@challenge = Challenge.new(
  name: 'Plastic-free Veggies', 
  description: 'Habitat destruction, fossil fuel emissions, and plastic pollution are some of the ways that plastic bags and climate change cannot be separated.  An estimated 12 million barrels of oil are used to manufacture the 30 million plastic bags that Americans use each year. That is equivalent to the amount of oil in our Strategic Oil Reserve. When used for bags, it is a wasteful and unnecessary way to deplete our oil supply and contribute to CO2 build-up in our atmosphere.',
  category: 'Waste',
  default_difficulty: 5,
  default_impact: 3
  )

  file = URI.open('https://res.cloudinary.com/dpdwv3yz1/image/upload/v1598886172/Component_3_hsosm5.png')
  @challenge.photo.attach(io: file, filename: 'Component_3_hsosm5.png', content_type: 'image/png')

@challenge.save

@challenge = Challenge.new(
  name: 'Go Vegan', 
  description: 'The U.N. believes that a global shift toward plant-based food is vital if we are to combat the worst effects of climate change. Globally, animal agriculture is responsible for more greenhouse gases than all the world’s transportation systems combined.',
  category: 'Food',
  default_difficulty: 9,
  default_impact: 9
  )

file = URI.open('https://res.cloudinary.com/dpdwv3yz1/image/upload/v1598886172/Component_5_dybpya.png')
@challenge.photo.attach(io: file, filename: 'Component_5_dybpya.png', content_type: 'image/png')
@challenge.save

@admin = User.new(
  email: 'admin@climately.io',
  password: '123456',
  first_name: 'Climately',
  last_name: 'Admin',
  user_name: 'climatelyadmin',
  admin: true,
  points: 100)
  file = URI.open('https://res.cloudinary.com/doewieec6/image/upload/v1598440482/belydzaow0mz6nxbqfztx7p7a4lw.jpg')
  @admin.photo.attach(io: file, filename: 'belydzaow0mz6nxbqfztx7p7a4lw.jpg', content_type: 'image/jpg')
@admin.save