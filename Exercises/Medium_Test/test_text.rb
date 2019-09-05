require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'text'

class TextTest < MiniTest::Test
  def setup
    @file = File.open('sample.txt','r')
  end

  def test_swap
    text = Text.new(@file.read)
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
et verius meuris, et pheretre mi.
    OUTPUT

    assert_equal(output, text.swap('a', 'e'))
  end

  def test_word_count
    text = Text.new(@file.read)
    assert_equal(72,text.word_count)
  end

  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"
  end

end