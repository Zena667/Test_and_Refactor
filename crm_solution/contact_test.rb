require "test/unit"
require_relative "crm_contact"

class ContactTest < Test::Unit::TestCase
	def setup
		@instance = Contact.new(1000, "Eric", "Szeto", "email@gmail.com", "notes")
	end

	def test_initialized_correctly
		assert_instance_of(Contact, @instance)
		assert_equal(1000, @instance.id)
		assert_equal("Eric", @instance.firstname)
		assert_equal("Szeto", @instance.lastname)
		assert_equal("email@gmail.com", @instance.email)
		assert_equal("notes", @instance.notes)
	end

	def test_display_contact_puts_so_returns_nil
		assert_equal(nil, @instance.display_contact)
	end

end