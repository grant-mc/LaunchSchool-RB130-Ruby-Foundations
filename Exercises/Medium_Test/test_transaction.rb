require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def setup
    @transaction = Transaction.new(30)
  end

  def test_prompt_for_payment
    input = StringIO.new('30\n')
    output = StringIO.new
    @transaction.prompt_for_payment(input: input, output: output)
    assert_equal(30, @transaction.amount_paid)
  end
end