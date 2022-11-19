# https://atcoder.jp/contests/arc061/tasks/arc061_a
S = gets.chomp
s_len = S.length

ans = 0

for i in 0..((1<<(s_len - 1)) -1) do
    tmp_num_string = S[0]

    for j in 0..(s_len - 1) do
        if i[j] != 0
            ans += tmp_num_string.to_i
            tmp_num_string = ""
        end

        if j != s_len -1
            tmp_num_string += S[j+1]
        end
    end
    
    ans += tmp_num_string.to_i
end

puts ans