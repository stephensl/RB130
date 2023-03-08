#-------------------------------------------------------------------------------
#                                 QUESTION: 1
#-------------------------------------------------------------------------------

# Classes to Test - Cash Register and Transaction

# These will be the classes you will be testing throughout the remaining exercises. You'll want to create two new files, one for each of the two classes listed below. You'll need this code for the remaining exercises of this set.

# # cash_register.rb

# class CashRegister
#   attr_reader :total_money

#   def initialize(total_money)
#     @total_money = total_money
#   end

#   def change(transaction)
#     transaction.amount_paid - transaction.item_cost
#   end

#   def give_receipt(transaction)
#     puts "You've paid $#{transaction.item_cost}."
#   end

#   def accept_money(transaction)
#     @total_money += transaction.amount_paid
#   end

#   def start_transaction(transaction)
#     transaction.prompt_for_payment
#     accept_money(transaction)
#     change(transaction)
#     give_receipt(transaction)
#   end
# end

# # transaction.rb

# class Transaction
#   attr_reader :item_cost
#   attr_accessor :amount_paid

#   def initialize(item_cost)
#     @item_cost = item_cost
#     @amount_paid = 0
#   end

#   def prompt_for_payment
#     loop do
#       puts "You owe $#{item_cost}.\nHow much are you paying?"
#       @amount_paid = gets.chomp.to_f
#       break if valid_payment? && sufficient_payment?
#       puts 'That is not the correct amount. ' \
#            'Please make sure to pay the full cost.'
#     end
#   end

#   private

#   def valid_payment?
#     amount_paid > 0.0
#   end

#   def sufficient_payment?
#     amount_paid >= item_cost
#   end
# end

#-------------------------------------------------------------------------------
#                                 ANSWER: 1
#-------------------------------------------------------------------------------
# Added files

#===============================================================================
#===============================================================================
#===============================================================================


#-------------------------------------------------------------------------------
#                                 QUESTION: 2
#-------------------------------------------------------------------------------

# Let's start things from the ground up. We want to make a simple test suite for our CashRegister class. Setup the initial testing file. You don't have to have any tests in your test file. For this exercise, write everything you would need to start testing CashRegister, excluding the tests themselves (necessary requires, test class, etc.).


#-------------------------------------------------------------------------------
#                                 ANSWER: 2
#-------------------------------------------------------------------------------
# cash_register_test.rb 

# require 'minitest/autorun'
# require_relative 'cash_register'
# require relative 'transaction'

# class CashRegisterTest < Minitest::Test

# end 

#===============================================================================
#===============================================================================
#===============================================================================


#-------------------------------------------------------------------------------
#                                 QUESTION: 3
#-------------------------------------------------------------------------------

# We now have the foundation of our CashRegister test class set up. Let's start testing! We'll start with the CashRegister#accept_money method. Write a test for the #accept_money method.


#-------------------------------------------------------------------------------
#                                 ANSWER: 3 
#-------------------------------------------------------------------------------
# require 'minitest/autorun'
# require_relative 'cash_register'
# require_relative 'transaction'

# class CashRegisterTest < Minitest::Test
#   def test_accept_money
#     register = CashRegister.new(100)
#     transaction = Transaction.new(25)
#     transaction.amount_paid = 25
    
#     initial_amount = register.total_money
#     register.accept_money(transaction)
#     current_amount = register.total_money

#     assert_equal(initial_amount + 25, current_amount)
#   end 
# end 
#===============================================================================
#===============================================================================
#===============================================================================

#-------------------------------------------------------------------------------
#                                 QUESTION: 4
#-------------------------------------------------------------------------------

# Write a test for the method, CashRegister#change.


#-------------------------------------------------------------------------------
#                                 ANSWER: 4
#-------------------------------------------------------------------------------
# def test_change
#   register = CashRegister.new(100)
#   transaction = Transaction.new(25)
#   transaction.amount_paid = 50

#   assert_equal(25, register.change(transaction))
# end 

#===============================================================================
#===============================================================================
#===============================================================================

#-------------------------------------------------------------------------------
#                                 QUESTION: 5
#-------------------------------------------------------------------------------

# Write a test for method CashRegister#give_receipt that ensures it displays a valid receipt.


#-------------------------------------------------------------------------------
#                                 ANSWER: 5
#-------------------------------------------------------------------------------
# def test_give_reciept
#   register = CashRegister.new(100)
#   transaction = Transaction.new(25)

#   assert_output("You've paid $25.\n") { register.give_receipt(transaction) }
# end 

#===============================================================================
#===============================================================================
#===============================================================================

#-------------------------------------------------------------------------------
#                                 QUESTION: 6
#-------------------------------------------------------------------------------
# Write a test that verifies that Transaction#prompt_for_payment sets the amount_paid correctly. We've changed the transaction class a bit to make testing this a bit easier. The Transaction#prompt_for_payment now reads as:

# def prompt_for_payment(input: $stdin)
#   loop do
#     puts "You owe $#{item_cost}.\nHow much are you paying?"
#     @amount_paid = input.gets.chomp.to_f # notice that we call gets on that parameter
#     break if valid_payment? && sufficient_payment?
#     puts 'That is not the correct amount. ' \
#          'Please make sure to pay the full cost.'
#   end
# end


#-------------------------------------------------------------------------------
#                                 ANSWER: 6
#-------------------------------------------------------------------------------
# require 'minitest/autorun'
# require_relative 'transaction'

# class TransactionTest < Minitest::Test
#   def test_prompt_for_payment
#     transaction = Transaction.new(50)
#     input = StringIO.new('50\n')
    
#     transaction.prompt_for_payment(input: input)

#     assert_equal(50, transaction.amount_paid)
#   end 
# end 



#===============================================================================
#===============================================================================
#===============================================================================

#-------------------------------------------------------------------------------
#                                 QUESTION: 7
#-------------------------------------------------------------------------------

# transaction#prompt_for_payment has a call to Kernel#puts and that output is showing up when we run our test. Your task for this exercise is to make it so that we have "clean" output when running this test.


#-------------------------------------------------------------------------------
#                                 ANSWER: 7
#-------------------------------------------------------------------------------
# class TransactionTest < Minitest::Test
#   def test_prompt_for_payment
#     transaction = Transaction.new(50)
#     input = StringIO.new('50\n')
#     output = StringIO.new
    
#     transaction.prompt_for_payment(input: input, output: output)

#     assert_equal(50, transaction.amount_paid)
#   end 
# end

#===============================================================================
#===============================================================================
#===============================================================================

#-------------------------------------------------------------------------------
#                                 QUESTION: 8
#-------------------------------------------------------------------------------

# Sample Text 

# Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sed vulputate ipsum.
# Suspendisse commodo sem arcu. Donec a nisi elit. Nullam eget nisi commodo, volutpat
# quam a, viverra mauris. Nunc viverra sed massa a condimentum. Suspendisse ornare justo
# nulla, sit amet mollis eros sollicitudin et. Etiam maximus molestie eros, sit amet dictum
# dolor ornare bibendum. Morbi ut massa nec lorem tincidunt elementum vitae id magna. Cras
# et varius mauris, at pharetra mi.



# Class and method to test

# class Text
#   def initialize(text)
#     @text = text
#   end

#   def swap(letter_one, letter_two)
#     @text.gsub(letter_one, letter_two)
#   end
# end

#-------------------------------------------------------------------------------
#                                 ANSWER: 8
#-------------------------------------------------------------------------------
# require 'minitest/autorun'
# require_relative 'text'

# class TextTest < Minitest::Test
#   TEST_LETTER_1 = 'a'
#   TEST_LETTER_2 = 'e'

#   def setup
#     @file = File.open('sample_text.txt', 'r')
#     @sample_text = @file.read 
#     @text = Text.new(@sample_text)
#   end

#   def test_swap
#     expected_text = @sample_text.gsub(TEST_LETTER_1, TEST_LETTER_2)
#     actual_text = @text.swap(TEST_LETTER_1, TEST_LETTER_2)
    
#     assert_equal(expected_text, actual_text) 
#   end

#   def teardown
#     @file.close
#   end
# end

#===============================================================================
#===============================================================================
#===============================================================================

#-------------------------------------------------------------------------------
#                                 QUESTION: 9
#-------------------------------------------------------------------------------


