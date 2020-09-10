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

@challenge1 = Challenge.new(
  name: 'Go Vegetarian', 
  description: 'Environmental vegetarianism is the practice of vegetarianism motivated by the desire to create a sustainable diet that avoids the negative environmental impact of meat production. Choosing a vegetarian diet will help you contribute to the reduction of pollution and you will also improve your health!.',
  category: 'Food',
  default_difficulty: 8,
  default_impact: 7
)

file = URI.open('https://res.cloudinary.com/dpdwv3yz1/image/upload/v1599228470/Group_47_igxyy4.png')
@challenge1.photo.attach(io: file, filename: 'Group_47_igxyy4.png', content_type: 'image/png')
@challenge1.save

@challenge2 = Challenge.new(
  name: 'No Cars', 
  description: 'Car emissions include several different chemicals and particulates that are produced when fuel is burned in an engine. Car pollution is one of the major causes of global warming. We have other possibilities, we could use our bikes and also stay fit. Using public transfer helps to fight against global warming. Let`s start! ',
  category: 'Mobility',
  default_difficulty: 8,
  default_impact: 6
  )
  file = URI.open('https://res.cloudinary.com/dpdwv3yz1/image/upload/v1599228470/Component_14_vcxgpw.png')
  @challenge2.photo.attach(io: file, filename: 'Component_14_vcxgpw.png', content_type: 'image/png')
@challenge2.save

@challenge3 = Challenge.new(
  name: 'Plastic-free bags', 
  description: 'Habitat destruction, fossil fuel emissions, and plastic pollution are some of the ways that plastic bags and climate change cannot be separated. An estimated 12 million barrels of oil are used to manufacture the 30 million plastic bags that Americans use each year. It is a wasteful and unnecessary way to deplete our oil supply and contribute to CO2 build-up in our atmosphere.',
  category: 'Waste',
  default_difficulty: 5,
  default_impact: 3
  )

  file = URI.open('https://res.cloudinary.com/dpdwv3yz1/image/upload/v1599228470/Group_49_uv8nre.png')
  @challenge3.photo.attach(io: file, filename: 'Group_49_uv8nre.png', content_type: 'image/png')
  @challenge3.save

@challenge4 = Challenge.new(
  name: 'Go Vegan', 
  description: 'Did you know animal agriculture is responsible for more greenhouse gases than all the world’s transportation systems combined? Crazy right! You’ve probably heard that it takes a lot of water to produce meat. In actual fact, it takes 2,500 gallons to make just one pound of meat. On the other hand, it only takes 25 gallons of our valuable water to grow one pound of wheat. Let`s go vegan!.',
  category: 'Food',
  default_difficulty: 9,
  default_impact: 9
  )

file = URI.open('https://res.cloudinary.com/dpdwv3yz1/image/upload/v1599228470/Group_48_bxx7ll.png')
@challenge4.photo.attach(io: file, filename: 'Group_48_bxx7ll.png', content_type: 'image/png')
@challenge4.save

@challenge5 = Challenge.new(
  name: 'Plastic Bottles', 
  description: "Do you know that it takes 450 years until a plastic bottle decompose. Plastic bottles that don’t end up in landfills, end up polluting our oceans, killing our environment, injuring and killing marine animals. It's believed the Great Pacific Garbage patch covers a surface area of 1.6 million square kilometers which is three times the size of France. Help to safe the nature.",
  category: 'Waste',
  default_difficulty: 7,
  default_impact: 7
  )

file = URI.open('https://res.cloudinary.com/dpdwv3yz1/image/upload/v1599228471/Plastic2_zc3lmp.png')
@challenge5.photo.attach(io: file, filename: 'Plastic2_zc3lmp.png', content_type: 'image/png')
@challenge5.save

@challenge6 = Challenge.new(
  name: 'Buy less, stop wasting', 
  description: 'Each year one-third of the world food production is wasted, and this is one of the major problems of global warming. You can do your part and be more conscious about what you buy every time you go to the groceries.',
  category: 'Food',
  default_difficulty: 3,
  default_impact: 4
)
file = URI.open('https://res.cloudinary.com/dpdwv3yz1/image/upload/v1599747067/food_ia2iif.png')
@challenge6.photo.attach(io: file, filename: 'food_ia2iif.png', content_type: 'image/png')
@challenge6.save

@challenge7 = Challenge.new(
  name: 'Rest your phone', 
  description: 'The energy consumption through the Internet and everything we do online can be really surprising! So leave your phone in your bag for 5 hours a day, go meet your friends, play a sport, or get creative!',
  category: 'Waste',
  default_difficulty: 7,
  default_impact: 5
)
file = URI.open('https://res.cloudinary.com/dpdwv3yz1/image/upload/v1599747067/phone_1_wndqsp.png')
@challenge7.photo.attach(io: file, filename: 'phone_1_wndqsp.png', content_type: 'image/png')
@challenge7.save

@challenge8 = Challenge.new(
  name: 'Conscious shopping', 
  description: 'The fast fashion industry emits tons of CO2 emissions and taught us that we need more and more clothes. Our challenge is to stop buy from these shops and buy second hand instead!',
  category: 'Waste',
  default_difficulty: 4,
  default_impact: 5
)
file = URI.open('https://res.cloudinary.com/dpdwv3yz1/image/upload/v1599747067/shopping_n13lct.png')
@challenge8.photo.attach(io: file, filename: 'shopping_n13lct.png', content_type: 'image/png')
@challenge8.save

@user1 = User.new(
  email: 'samira.eilinger@climately.io',
  password: '123456',
  first_name: 'Samira',
  last_name: 'Eilinger',
  user_name: 'samirajil',
  points: rand(0..100)*10)
  file = URI.open('https://kitt.lewagon.com/placeholder/users/samirajil.jpeg')
  @user1.photo.attach(io: file, filename: 'samirajil.jpeg', content_type: 'image/jpeg')
@user1.save

@user2 = User.new(
  email: 'celine.stalder@student.unisg.ch',
  password: '123456',
  first_name: 'Céline',
  last_name: 'Stalder',
  user_name: 'celinevalerie',
  points: rand(0..100)*10)
  file = URI.open('https://kitt.lewagon.com/placeholder/users/celinevalerie.jpeg')
  @user2.photo.attach(io: file, filename: 'celinevalerie.jpeg', content_type: 'image/jpeg')
@user2.save

@user3 = User.new(
  email: 'mariana.toscana@climately.io',
  password: '123456',
  first_name: 'Mariana',
  last_name: 'Toscano',
  user_name: 'mariana',
  points: rand(0..100)*10)
  file = URI.open('https://kitt.lewagon.com/placeholder/users/MarianaToscano.jpeg')
  @user3.photo.attach(io: file, filename: 'MarianaToscano.jpeg', content_type: 'image/jpeg')
@user3.save

@user4 = User.new(
  email: 'lena.schlage@climately.io',
  password: '123456',
  first_name: 'Lena',
  last_name: 'Schlage',
  user_name: 'lenajohanna',
  points: rand(0..100)*10)
  file = URI.open('https://kitt.lewagon.com/placeholder/users/wwnwn.jpeg')
  @user4.photo.attach(io: file, filename: 'wwnwn.jpeg', content_type: 'image/jpeg')
@user4.save

@user5 = User.new(
  email: 'sifan.xiao@climately.io',
  password: '123456',
  first_name: 'Sifan',
  last_name: 'Xiao',
  user_name: 'jakexiao')
  file = URI.open('https://kitt.lewagon.com/placeholder/users/jakexiao.jpeg')
  @user5.photo.attach(io: file, filename: 'jakexiao.jpeg', content_type: 'image/jpeg')
@user5.save

@user6 = User.new(
  email: 'florian.ott@climately.io',
  password: '123456',
  first_name: 'Florian',
  last_name: 'Ott',
  user_name: 'Flott2410')
  file = URI.open('https://kitt.lewagon.com/placeholder/users/Flott2410.jpeg')
  @user6.photo.attach(io: file, filename: 'Flott2410.jpeg', content_type: 'image/jpeg')
@user6.save

@friendship = Friendship.new(
  user: @user1, 
  friend: @user2
)

@friendship = Friendship.new(
  user: @user2, 
  friend: @user1
)

@friendship = Friendship.new(
  user: @user2, 
  friend: @user5
)

@friendship = Friendship.new(
  user: @user1, 
  friend: @user4
)

@friendship = Friendship.new(
  user: @user2, 
  friend: @user4
)

@friendship = Friendship.new(
  user: @user2, 
  friend: @user3
)

@chatroom = Chatroom.create

@group1 = Group.new(
  completed: true,
  difficulty: rand(2..10),
  impact: rand(2..10),
  duration: 3, 
  exceptions: rand(1..7), 
  points: rand(10..99)*10, 
  challenge: @challenge1,
  chatroom_id: @chatroom.id
  )
@group1.created_at = "2020-08-10 00:00:00"
@group1.save

@chatroom = Chatroom.create

@group2 = Group.new(
  completed: false,
  difficulty: rand(2..10),
  impact: rand(2..10),
  duration: rand(1..10), 
  exceptions: rand(1..7), 
  points: rand(10..99)*10, 
  challenge: @challenge2,
  chatroom_id: @chatroom.id
  )
@group2.save

@group3 = Group.new(
  completed: false,
  difficulty: rand(2..10),
  impact: rand(2..10),
  duration: rand(1..10), 
  exceptions: rand(1..7), 
  points: rand(10..99)*10, 
  challenge: @challenge3,
  chatroom_id: @chatroom.id
  )
@group3.save

@group4 = Group.new(
  completed: false,
  difficulty: rand(2..10),
  impact: rand(2..10),
  duration: rand(1..10), 
  exceptions: rand(1..7), 
  points: rand(10..99)*10, 
  challenge: @challenge4,
  chatroom_id: @chatroom.id
  )
@group4.created_at = "2020-02-01 00:00:00"
@group4.save

@group5 = Group.new(
  completed: false,
  difficulty: rand(2..10),
  impact: rand(2..10),
  duration: rand(1..10), 
  exceptions: rand(1..7), 
  points: rand(10..99)*10, 
  challenge: @challenge5,
  chatroom_id: @chatroom.id
  )
@group5.created_at = "2020-02-01 00:00:00"
@group5.save

@users_group = UserGroup.new(
  status: "active",
  group: @group5,
  user: @user2)
@users_group.save

@users_group = UserGroup.new(
  status: "active",
  group: @group5,
  user: @user3)
@users_group.save

@users_group = UserGroup.new(
  status: "active",
  group: @group5,
  user: @user4)
@users_group.save

@users_group = UserGroup.new(
  status: "active",
  group: @group5,
  user: @user5)
@users_group.save

@users_group = UserGroup.new(
  status: "active",
  group: @group2,
  user: @user2)
@users_group.save

@users_group = UserGroup.new(
  status: "completed",
  group: @group3,
  user: @user2)
@users_group.save

@users_group = UserGroup.new(
  status: "invited",
  group: @group4,
  user: @user2)
@users_group.save

@users_group = UserGroup.new(
  status: 'completed',
  group: @group4,
  user: @user2)
@users_group.save

@users_group = UserGroup.new(
  status: 'completed',
  group: @group5,
  user: @user2)
@users_group.save

@users_group = UserGroup.new(
  status: 'completed',
  group: @group1,
  user: @user3)
@users_group.save

@users_group = UserGroup.new(
  status: 'completed',
  group: @group5,
  user: @user4)
@users_group.save

@users_group = UserGroup.new(
  status: 'active',
  group: @group5,
  user: @user1)
@users_group.save

@users_group = UserGroup.new(
  group: @group1,
  user: @user2)
@users_group.save
