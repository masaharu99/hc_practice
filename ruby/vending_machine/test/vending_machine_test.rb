require 'minitest/autorun'
require_relative '../vending_machine'
require_relative '../suica'

class VendingMachineTest < Minitest::Test
  def test_buy_pepsi
    vending_machine = VendingMachine.new
    suica = Suica.new
    vending_machine.buy(:pepsi, suica)

    assert_equal 4, vending_machine.stock(:pepsi)
    assert_equal 150, vending_machine.sales
    assert_equal 350, suica.charge
  end

  def test_buy_monster
    vending_machine = VendingMachine.new
    suica = Suica.new
    vending_machine.buy(:monster, suica)

    assert_equal 4, vending_machine.stock(:monster)
    assert_equal 230, vending_machine.sales
    assert_equal 270, suica.charge
  end

  def test_buy_irohasu
    vending_machine = VendingMachine.new
    suica = Suica.new
    vending_machine.buy(:irohasu, suica)

    assert_equal 4, vending_machine.stock(:irohasu)
    assert_equal 120, vending_machine.sales
    assert_equal 380, suica.charge
  end

  def test_buy_all
    vending_machine = VendingMachine.new
    suica = Suica.new
    vending_machine.buy(:pepsi, suica)
    vending_machine.buy(:monster, suica)
    vending_machine.buy(:irohasu, suica)

    assert_equal 500, vending_machine.sales
    assert_equal 0, suica.charge
  end

  def test_charge_shortage
    vending_machine = VendingMachine.new
    suica = Suica.new
    begin
      6.times { vending_machine.buy(:pepsi, suica) }
    rescue => e
      assert_equal RuntimeError, e.class
      assert_equal 'チャージ残高が不足しています', e.message
    end
  end

  def test_stock_shortage
    vending_machine = VendingMachine.new
    suica = Suica.new
    suica.add_charge(1000)
    begin
      6.times { vending_machine.buy(:pepsi, suica) }
    rescue => e
      assert_equal RuntimeError, e.class
      assert_equal 'pepsiは在庫が不足しています', e.message
    end
  end

  def test_add_stock
    vending_machine = VendingMachine.new
    vending_machine.add_stock(:pepsi, 5)
    vending_machine.add_stock(:monster, 7)
    vending_machine.add_stock(:irohasu, 10)

    assert_equal 10, vending_machine.stock(:pepsi)
    assert_equal 12, vending_machine.stock(:monster)
    assert_equal 15, vending_machine.stock(:irohasu)
  end
end
