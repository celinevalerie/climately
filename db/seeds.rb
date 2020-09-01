# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@challenge = Challenge.new(
  name: 'Meat-Free Challenge', 
  description: 'Environmental vegetarianism is the practice of vegetarianism when motivated by the desire to create a sustainable diet that avoids the negative environmental impact of meat production. Livestock as a whole is estimated to be responsible for around 18% of global greenhouse gas emissions.',
)
@challenge.save

@group = Group.new(
  completed: false,
  difficulty: 10,
  impact: 8,
  duration: 21, 
  exceptions: 2, 
  points: 626, 
  challenge: @challenge)
@group.save

@user1 = User.new(
  email: 'samira.eilinger@climately.io',
  password: '123456',
  first_name: 'Samira',
  last_name: 'Eilinger',
  user_name: 'samirajil',
  points: 200)
@user1.save

@user2 = User.new(
  email: 'celine.stalder@climately.io',
  password: '123456',
  first_name: 'Céline',
  last_name: 'Stalder',
  user_name: 'celinevalerie',
  points: 400)
@user2.save

@users_group = UserGroup.new(
  participating: 'true',
  group: @group,
  user: @user1)
@users_group.save

@users_group = UserGroup.new(
  participating: 'true',
  group: @group,
  user: @user2)
@users_group.save

@friendship = Friendship.new(
  user: @user1, 
  friend: @user2
)

@challenge = Challenge.new(
  name: 'Plastic Bottles', 
  description: "Almost all plastic is derived from materials (like ethylene and propylene) made from fossil fuels (mostly oil and gas). The process of extracting and transporting those fuels, then manufacturing plastic creates billions of tonnes of greenhouse gases. For example, 4% of the world's annual petroleum production is diverted to making plastic, and another 4% gets burned in the refining process. But how we manage all the plastic that then goes into circulation is equally troubling. Of the almost 3 million tonnes of plastic that Australia produces each year, 95% is discarded after a single use. Less than 12% is recycled, which leaves a staggering amount to be disposed of - in landfills or incinerated.",
)
@challenge.save

@group = Group.new(
  completed: false,
  difficulty: 7,
  impact: 5,
  duration: 14, 
  exceptions: 2 
  points: 326, 
  challenge: @challenge)
@group.save

@user1 = User.new(
  email: 'mariana.toscana@climately.io',
  password: '123456',
  first_name: 'Mariana',
  last_name: 'Toscano',
  user_name: 'mariana',
  points: 100)
@user1.save

@user2 = User.new(
  email: 'lena.schlage@climately.io',
  password: '123456',
  first_name: 'Lena',
  last_name: 'Schlage',
  user_name: 'lenajohanna',
  points: 600)
@user2.save

@users_group = UserGroup.new(
  participating: 'false',
  group: @group,
  user: @user1)
@users_group.save

@users_group = UserGroup.new(
  participating: 'true',
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

