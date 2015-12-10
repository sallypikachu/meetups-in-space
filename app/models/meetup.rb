class Meetup < ActiveRecord::Base
  has_many :usermeetups
  has_many :users, through: :usermeetups
end
