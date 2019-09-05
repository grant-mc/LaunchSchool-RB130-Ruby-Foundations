require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def setup
    @register = CashRegister.new(1000)
    @transaction = Transaction.new(20)
  end

  def test_accept_money
    @transaction.amount_paid = 20

    previous_amount = @register.total_money
    @register.accept_money(@transaction)
    current_amount = @register.total_money

    assert_equal previous_amount + 20, current_amount
  end

  def test_change
    @transaction.amount_paid = 50

    assert_equal(30, @register.change(@transaction))
  end

  def test_give_receipt
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    You've paid $20.

    OUTPUT

    assert_output(output) { @register.give_receipt(@transaction) }
  end

end