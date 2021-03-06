# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

add1 = "41 Rue de la Lune, Paris, France"

add2 = "139b Bethnal Green Road, London, UK"

add3 = "55 Hugh Street, London, UK"

add4 = "Leoforos Vasilissis Sofias 91, Athens, Greece"

add5 = "Berlin Central Station, Europaplatz, Berlin, Germany"

add6 = "16 Passage de la Folie-Regnault, Paris, France"

add7 = "39 Avenue Pierre 1er de Serbie, Paris, France"

add8 = "13 Rue de Lyon, Chazelles-sur-Lyon, France"

add = [add1, add2, add3, add4, add5, add6, add7, add8]


5.times do
	email = Faker::Internet.email
	user = User.new(email: email, password: "passwordtest")
	if user.save
		puts "#{user.email} created and saved"
	end
end
puts "5 users created and saved!"


i = 1
8.times do
	image_path = "http://res.cloudinary.com/arnauddlc/image/upload/v1519371092/kitchens/kitchen#{i}.jpg"
	puts image_path
	price = rand(10..150)
	user = User.find(rand(1..5))
	title = Faker::StarWars.character + "'s kitchen"
	description ="Lorem ipsum dolor amet leggings taiyaki jean shorts pabst actually authentic vape green juice PBR&B. Truffaut iPhone actually, stumptown organic before they sold out biodiesel next level sustainable. Offal farm-to-table quinoa shoreditch organic la croix, YOLO air plant etsy. Aesthetic enamel pin taiyaki pok pok. Mlkshk listicle keytar vexillologist. Franzen thundercats ugh affogato pug, tilde deep v meditation pork belly taxidermy synth. Adaptogen echo park hell of squid affogato vaporware banjo af. Vice af portland venmo tumeric gluten-free cardigan pork belly tattooed."
	address = add[i-1]
	puts address
	# Faker::Address.street_address + " " + Faker::Address.city
	new_kitchen = Kitchen.new(user: user, price: price, address: address, title: title, description: description )
	new_kitchen.remote_picture_url = image_path;

	if new_kitchen.save
		puts "#{new_kitchen.title} has been created and saved"
	end
	i += 1
end
puts "8 kitchens have been created and saved!"