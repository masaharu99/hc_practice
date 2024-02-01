# frozen_string_literal: true

# グループ分け問題
class Random
  members = %w[A B C D E F].shuffle
  first_group_num = rand(2..3)

  first_group = members[0..(first_group_num - 1)].to_s
  second_group = members[first_group_num..(members.length - 1)].to_s

  puts first_group
  puts second_group
end
