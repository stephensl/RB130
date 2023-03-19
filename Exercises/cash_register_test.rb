require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def test_accept_money
    register = CashRegister.new(100)
    transaction = Transaction.new(25)
    transaction.amount_paid = 25
    
    initial_amount = register.total_money
    register.accept_money(transaction)
    current_amount = register.total_money

    assert_equal(initial_amount + 25, current_amount)
  end 

  def test_change
    register = CashRegister.new(100)
    transaction = Transaction.new(25)
    transaction.amount_paid = 50

    assert_equal(25, register.change(transaction))
  end 

  def test_give_reciept
    register = CashRegister.new(100)
    transaction = Transaction.new(25)

    assert_output("You've paid $25.\n") { register.give_receipt(transaction) }
  end 
end 