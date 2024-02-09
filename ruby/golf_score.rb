# 規定打数
pars = gets.chomp.split(',').map { |par| par.to_i }
# プレイヤーの打数
player_strokes =  gets.split(',').map { |stroke| stroke.to_i }

scores = []
pars.length.times do |i|
  # プレイヤーの打数が1 かつ 規定打数が3,4のどちらか
  if player_strokes[i] == 1 && (pars[i] == 3 || pars[i] == 4)
    scores << 'ホールインワン'
    next
  end

  # プレイヤーの打数 - 規定打数
  score = player_strokes[i] - pars[i]
  case score
  when 0
    scores << 'パー'
  when -1
    scores << 'バーディ'
  when -2
    scores << 'イーグル'
  when -3
    scores << 'アルバトロス'
  when -4
    scores << 'コンドル'
  when 1
    scores << 'ボギー'
  when (2..)
    scores << "#{score}ボギー"
  end
end
puts scores.join(',')
