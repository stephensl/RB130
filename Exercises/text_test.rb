# # Testing for text.rb 

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

  def test_word_count 
    assert_equal(72, @text.word_count)
  end 
end