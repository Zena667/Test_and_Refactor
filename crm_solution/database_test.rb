require "test/unit"
require_relative "crm_database"
require_relative "crm_contact"

class DatabaseTest < Test::Unit::TestCase

	def setup
		@instance = Database.new
		@instance.add(Contact.new(2000, "Zena", "Bielewicz", "email2@gmail.com", "notesss"))
	end

	def test_initialized_properly
		initial_test = Database.new
		assert_equal([], initial_test.contacts_array)
	end

	def test_add_contact_works
		@instance.add(Contact.new(1000, "Eric", "Szeto", "email@gmail.com", "notes"))
		assert_equal(2, @instance.contacts_array.size)
	end

	def test_modify_contact_working
		@instance.modify_contact("Zena", "firstname", "Pie")
		contact = @instance.contacts_array[0]
		assert_equal("Pie", contact.firstname)
	end

	def test_modify_contact_failed
		@instance.modify_contact("Eric", "firstname", "Pie")
		contact = @instance.contacts_array[0]
		assert_equal("Zena", contact.firstname)
	end

	def test_display_by_attribute_working
		assert_equal(["Zena"], @instance.display_info_by_attribute("firstname"))
	end


	def test_delete_contact_working
		@instance.delete_contact(2000)
		assert_equal(0, @instance.contacts_array.size)
	end

	def test_delete_contact_with_invalid_information
		@instance.delete_contact(1000)
		assert_equal(1, @instance.contacts_array.size)
	end

end
