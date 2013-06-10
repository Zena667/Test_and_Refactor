# crm_runner has the single responsibility of managing the interactions with
# contacts_array, which acts as our "database" 

require_relative "crm_contact"

class Database

	# Attr_accessor lets call "contacts_array" on our database to return all of the contacts
	attr_accessor :contacts_array
	
	# A "database" is created as an empty contacts_array
	def initialize
		@contacts_array = Array.new
	end

	# A contact can be passed to the add method to insert another contact in the contacts_array
	def add(contact)
		@contacts_array << contact
	end

	# Check if there is a contact with an attribute that matches our selection
	# If we have a match, set the specified attribute to the new value
	def modify_contact(selection, attribute, modification)
		contact = @contacts_array.detect do |contact|
			(contact.id == selection) || (contact.firstname == selection) || (contact.lastname == selection) || (contact.email == selection)
		end
		if contact 
			contact.send(attribute + '=', modification) rescue nil
		end
		contact # good practice to return object at the end of the method
	end

	# Display all of the contacts in the contacts_array
	def display_all_contacts
	 	@contacts_array.each do |contact|
	 		contact.display_contact
	 	end
	end

	# Check if there is a contact with an attribute that matches our "query"
	# If we have a match, display all of the contact's attributes
	def display_particular_contact(attribute) 
		@contacts_array.each do |contact|
			if (contact.id == attribute) || (contact.firstname == attribute) || (contact.lastname == attribute) || (contact.email == attribute)
				contact.display_contact
			end 
		end
	end

	# Loop through the contacts_array, sending the specified attribute value of each contact
	# into a newly created attribute array
	def display_info_by_attribute(arg)
		attribute_array = []
		@contacts_array.each do |contact|
			attribute_array << contact.send(arg) # Database#send passes the 'arg' string to contact, but as a method and not as a string
		end
		attribute_array
	end

	# Check if there is a contact with an attribute that matches our "query"
	# If we have a match, delete the correct contact
	def delete_contact(attribute)
		@contacts_array.each do |contact|
			if (contact.id == attribute) || (contact.firstname == attribute) || (contact.lastname == attribute) || (contact.email == attribute)
				@contacts_array.delete(contact)
			else
				return false
			end 
		end
	end

end