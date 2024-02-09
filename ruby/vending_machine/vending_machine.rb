require_relative './juce'

# 自動販売機クラス
class VendingMachine
  def initialize
    pepsi = Juce.new(:pepsi, 150)
    monster = Juce.new(:monster, 230)
    irohasu = Juce.new(:irohasu, 120)
    @stocks = [
      { juce: pepsi, number: 5 },
      { juce: monster, number: 5 },
      { juce: irohasu, number: 5 },
    ]
    @sales = 0
  end

  # 在庫数を取得する
  # @param [Sysbol] ジュースの種類
  # @return [Integer] 在庫数
  def stock(name)
    juce_hash(name)[:number]
  end

  # 購入可能なリストを取得する
  # 在庫が0本のジュースは取得しない
  # @return [Array] 購入可能リスト
  def can_buy_list
    @stocks.filter do |stock|
      !stock[:number].zero?
    end
  end

  # 購入可能か判定する
  # 在庫が0本のジュースは購入不可能
  # @param [Symbol] ジュースの種類
  def can_buy?(name)
    # 購入可能リストを取得
    stocks = can_buy_list
    can_buy_list.any? { |stock| stock[:juce].name == name }
  end

  # ジュースを購入する
  # @param [Symbol] ジュースの種類
  # @param [Suica] 使用するSuica
  # @raise [RuntimeError] チャージ残高が不足している場合、在庫が不足している場合
  def buy(name, suica)
    raise "#{name}は在庫が不足しています" if stock(name) == 0

    # 購入するHashオブジェクトを取得
    juce_hash = juce_hash(name)
    juce = juce_hash[:juce]
    raise "チャージ残高が不足しています" if suica.charge < juce.price

    # 購入処理
    juce_hash[:number] -= 1
    @sales += juce.price
    suica.spend_charge(juce.price)
  end

  # 在庫を補充する
  # @param [Symbol] 補充するジュース
  # @param [Integer] 補充本数
  def add_stock(name, number)
    # 購入するHashオブジェクトを取得
    juce_hash = juce_hash(name)
    juce_hash[:number] += number
  end

  # 売り上げ金額を取得する
  # @return [Integer] 売り上げ金額
  def sales
    @sales
  end

  private
  # ジュースのHashオブジェクトを取得する
  # param [Symbol] ジュースの種類
  # return [Hash] ジュースのHash
  def juce_hash(name)
    @stocks.find { |stock| stock[:juce].name == name }
  end
end
