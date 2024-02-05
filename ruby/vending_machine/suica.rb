# Suicaクラス
class Suica
  def initialize
    @charge = 500
  end

  # チャージ残高を確認する
  # @return [Integer] チャージ残高
  def charge
    @charge
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
