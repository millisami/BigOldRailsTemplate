require 'factory_girl_extensions'
require 'faker'
require 'populator'

#AVATAR = File.join(Rails.root, "public", "images", "avatar_sample.jpg")
#=================================

Factory.sequence :login do |n|
  "user#{n}"
end
Factory.sequence :email do |n|
  "user#{n}@example.com"
end

Factory.define :user do |user|
  user.login                 { Factory.next :login }
  user.email                 { Factory.next :email }
  user.password              { "password" }
  user.password_confirmation { |u| u.password }
  user.first_name Faker::Name.first_name
  user.last_name  Faker::Name.last_name
end

#Factory.define :active_user, :parent => :user do |user|
#  user.state { "active" }
#end

