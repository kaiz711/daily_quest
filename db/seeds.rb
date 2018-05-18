# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin_user = User.create( nickname: "관리자", email: 'admin@admin.com', password: '12345678')
admin_user.add_role :admin

Userquest.create( user_id: 1, quest_id: 90, success: 2)