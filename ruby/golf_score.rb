# 規定打数が3の時のスコアを計算する
#
# @params [Integer] player_strokes プレイヤーの打数
# @return [String] スコア結果
def calculate_when_par_is_3(player_strokes)
  case player_strokes
  when 1
    'ホールインワン'
  when 2
    'バーディ'
  when 3
    'パー'
  when 4
    'ボギー'
  else
    "#{player_strokes - 3}ボギー"
  end
end

# 規定打数が4の時のスコアを計算する
#
# @params [Integer] player_strokes プレイヤーの打数
# @return [String] スコア結果
def calculate_when_par_is_4(player_strokes)
  case player_strokes
  when 1
    'ホールインワン'
  when 2
    'イーグル'
  when 3
    'バーディ'
  when 4
    'パー'
  when 5
    'ボギー'
  else
    "#{player_strokes - 4}ボギー"
  end
end

# 規定打数が5の時のスコアを計算する
#
# @params [Integer] player_strokes プレイヤーの打数
# @return [String] スコア結果
def calculate_when_par_is_5(player_strokes)
  case player_strokes
  when 1
    'コンドル'
  when 2
    'アルバトロス'
  when 3
    'イーグル'
  when 4
    'バーディ'
  when 5
    'パー'
  when 6
    'ボギー'
  else
    "#{player_strokes - 5}ボギー"
  end
end

def main
  pars = gets.chomp.split(',')
  player_strokes =  gets.split(',')

  scores = []
  pars.length.times do |i|
    case pars[i].to_i
    when 3
      scores << calculate_when_par_is_3(player_strokes[i].to_i)
    when 4
      scores << calculate_when_par_is_4(player_strokes[i].to_i)
    when 5
      scores << calculate_when_par_is_5(player_strokes[i].to_i)
    end
  end
  puts scores.join(',')
end

main
