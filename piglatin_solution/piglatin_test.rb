require 'test/unit'
require_relative 'piglatin'

class PiglatinTest < Test::Unit::TestCase 

	def test_class_exists
		a = PiglatinConverter.new
		assert_instance_of(PiglatinConverter, a)
	end

	def test_self_convert_works_with_valid_input
		a = PiglatinConverter.convert("tree")
		assert_equal("eetray", a)
	end

	def test_self_convert_works_with_invalid_input
		a = PiglatinConverter.convert("")
		assert_equal("", a)
	end

	def test_self_convert_works_with_invalid_input_nil
		a = PiglatinConverter.convert(nil)
		assert_equal(nil, a)
	end

end

