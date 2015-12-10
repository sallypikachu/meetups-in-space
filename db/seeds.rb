# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
#   Person.create(first_name: 'Eric', last_name: 'Kelly')

sally = User.create(provider: "github", uid: "1", username: "sallypikachu", email: "sally@gmail.com", avatar_url: "sally.jpg")
michelle = User.create(provider: "github", uid: "2", username: "meidenbee", email: "michelle@gmail.com", avatar_url: "michelle.jpg")
fluffy = User.create(provider: "github", uid: "3", username: "im_so_fluffy", email: "fluffy@gmail.com", avatar_url: "fluffy.jpg")

bboy = Meetup.create(title: "Breaking", details: "Bboy 4 lyfe", tag: "break dance")
cooking = Meetup.create(title: "Cooking", details: "Let's learn to cook!", tag: "cooking")
eating = Meetup.create(title: "Eating", details: "Let's stuff our faces!", tag: "eating")

Usermeetup.create(user: sally, meetup: bboy)
Usermeetup.create(user: sally, meetup: cooking)
Usermeetup.create(user: sally, meetup: eating)
Usermeetup.create(user: michelle, meetup: cooking)
Usermeetup.create(user: michelle, meetup: eating)
Usermeetup.create(user: fluffy, meetup: bboy)
Usermeetup.create(user: fluffy, meetup: eating)
