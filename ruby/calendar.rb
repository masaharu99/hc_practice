# frozen_string_literal: true

require 'optparse'
require 'date'

# カレンダーを作る
class Calendar
  # mオプションを定義
  opt = OptionParser.new
  opt.on('-m month') { |month| month }
  # mオプションの値を取得
  params = {}
  begin
    opt.parse(ARGV, into: params)
  rescue OptionParser::MissingArgument
  end
  month = params[:m].to_i unless params[:m].nil?

  # mオプションの引数が1~12以外の場合、エラー出力
  if !month.nil? && !(1..12).cover?(month)
    puts "#{month} is neither a month number (1..12) nor a name"
    exit
  end

  # 月初のDateオブジェクトを取得
  first_date = Date.new(Date.today.year, month || Date.today.month, 1)

  puts "#{first_date.month}月 #{first_date.year}".center(20)
  puts '月 火 水 木 金 土 日'

  # 月初の曜日に応じてスペースの数を変更する
  case first_date.wday
  in 0
    print ' ' * 17
  in 1
  in n unless n == 1
    space_num =
    print ' ' * ((first_date.wday - 1) * 3 - 1)
  end

  # 月末のDateオブジェクトを取得
  last_date = Date.new(first_date.year, first_date.month, -1)

  (first_date..last_date).each do |date|
    # 月曜日
    if date.wday == 1
      # 1日以外の場合、改行をいれる
      puts unless date.day == 1
      print format('%2d', date.day)
    # 上記以外
    else
      print format('%3d', date.day)
    end
  end

  # calコマンドで改行が入っていたため
  print "\n\n"
end
