require 'minitest/autorun'
require_relative 'juce'

class JuceTest < Minitest::Test
  def test_juce
    juce = Juce.new('いろはす', 150)
    assert_equal 'いろはす', juce.name
    assert_equal 150, juce.price
  end
end
