# Suicaクラス
class Suica
  attr_reader :charge

  def initialize
    @charge = 500
  end

  # チャージする
  # @params [Integer] チャージする金額
  def add_charge(amount)
    @charge += amount
  end

  # チャージ残高を使用する
  # @params [Integer] 使用する金額
  def spend_charge(amount)
    @charge -= amount
  end

end
