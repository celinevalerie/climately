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

file = URI.open('https://res.cloudinary.com/dpdwv3yz1/image/upload/v1599228470/Group_47_igxyy4.png')
@challenge.photo.attach(io: file, filename: 'Group_47_igxyy4.png', content_type: 'image/png')

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
  description: "Do you know that it takes 450 years until a plastic bottle decompose. Plastic bottles that don’t end up in landfills end up polluting our oceans, killing our environment, injuring and killing marine animals. Its believed the Great Pacific Garbage patch covers a surface area of 1.6 million square kilometers which is three times the size of France. Help to safe the nature.",
  category: 'Waste',
  default_difficulty: 7,
  default_impact: 7
  )

file = URI.open('https://res.cloudinary.com/dpdwv3yz1/image/upload/v1599228471/Plastic2_zc3lmp.png')
@challenge.photo.attach(io: file, filename: 'Plastic2_zc3lmp.png', content_type: 'image/png')
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
  description: 'Car emissions include several different chemicals and particulates that are produced when fuel is burned in an engine. Car pollution is one of the major causes of global warming. We have other possibilities, we could use our bikes and also stay fit. Using public transfer helps to fight against global warming. Let`s start! ',
  category: 'Mobility',
  default_difficulty: 8,
  default_impact: 6
  )
  file = URI.open('https://res.cloudinary.com/dpdwv3yz1/image/upload/v1599228470/Component_14_vcxgpw.png')
  @challenge.photo.attach(io: file, filename: 'Component_14_vcxgpw.png', content_type: 'image/png')
@challenge.save

@challenge = Challenge.new(
  name: 'Plastic-free Veggies', 
  description: 'Habitat destruction, fossil fuel emissions, and plastic pollution are some of the ways that plastic bags and climate change cannot be separated.  An estimated 12 million barrels of oil are used to manufacture the 30 million plastic bags that Americans use each year. That is equivalent to the amount of oil in our Strategic Oil Reserve. When used for bags, it is a wasteful and unnecessary way to deplete our oil supply and contribute to CO2 build-up in our atmosphere.',
  category: 'Waste',
  default_difficulty: 5,
  default_impact: 3
  )

  file = URI.open('https://res.cloudinary.com/dpdwv3yz1/image/upload/v1599228470/Group_49_uv8nre.png')
  @challenge.photo.attach(io: file, filename: 'Group_49_uv8nre.png', content_type: 'image/png')

@challenge.save

@challenge = Challenge.new(
  name: 'Go Vegan', 
  description: 'Did you know animal agriculture is responsible for more greenhouse gases than all the world’s transportation systems combined? Crazy right! You’ve probably heard that it takes a lot of water to produce meat. In actual fact, it takes 2,500 gallons to make just one pound of meat. On the other hand, it only takes 25 gallons of our valuable water to grow one pound of wheat. Let`s go vegan!.',
  category: 'Food',
  default_difficulty: 9,
  default_impact: 9
  )

file = URI.open('https://res.cloudinary.com/dpdwv3yz1/image/upload/v1599228470/Group_48_bxx7ll.png')
@challenge.photo.attach(io: file, filename: 'Group_48_bxx7ll.png', content_type: 'image/png')
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
