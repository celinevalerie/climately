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
  points: 200)
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



