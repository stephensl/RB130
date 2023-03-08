# # Testing for text.rb 

# require 'minitest/autorun'
# require_relative 'text'

# class TextTest < Minitest::Test 
#   def setup 
#     @file = File.open('./sample_text.txt', 'r')
#   end 

#   def test_swap 
#     text = Text.new(@file.read)
#     actual_text = text.swap('a', 'e')
#     expected_text = <<~TEXT.chomp
#     Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
#     Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
#     quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres et verius meuris, et pheretre mi.
#     TEXT

#     assert_equal(expected_text, actual_text)
#   end

#   def teardown 
#     @file.close
#   end 
# end

require 'minitest/autorun'
require_relative 'text'

class TextTest < Minitest::Test
  TEST_LETTER_1 = 'a'
  TEST_LETTER_2 = 'e'

  def setup
    @file = File.open('sample_text.txt', 'r')
    @sample_text = @file.read 
    @text = Text.new(@sample_text)
  end

  def test_swap
    expected_text = @sample_text.gsub(TEST_LETTER_1, TEST_LETTER_2)
    actual_text = @text.swap(TEST_LETTER_1, TEST_LETTER_2)
    
    assert_equal(expected_text, actual_text) 
  end

  def teardown
    @file.close
  end
end