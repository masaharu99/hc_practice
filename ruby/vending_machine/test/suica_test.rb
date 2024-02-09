require 'minitest/autorun'
require_relative '../suica'

class SuicaTest < Minitest::Test
  def test_suica
    suica = Suica.new
    assert_equal 500, suica.charge

    suica.add_charge(100)
    assert_equal 600, suica.charge

    suica.spend_charge(200)
    assert_equal 400, suica.charge
  end
end
