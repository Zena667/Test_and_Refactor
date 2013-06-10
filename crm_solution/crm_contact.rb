# crm_contact has the single responsibility of creating, reading and updating a contact

class Contact

	# Attr_accessor is used to be able to update (get or set) contact attributes after they are initialized
	attr_accessor :id, :firstname, :lastname, :email, :notes

	# The attributes of a contact are set to instance variables when the contact is created
	def initialize(id, firstname, lastname, email, notes)
		@id = id
		@firstname = firstname
		@lastname = lastname
		@email = email
		@notes = notes
	end

	# Display all of the attributes of a contact
	def display_contact
		puts "ID:         #{id}"
		puts "First Name: #{firstname}"
		puts "Last Name:  #{lastname}"
		puts "Email:      #{email}"
		puts "Notes:      #{notes}"
		puts 
		puts "-------------------------------------------"
		puts
	end


end