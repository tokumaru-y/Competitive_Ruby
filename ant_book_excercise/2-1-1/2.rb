# https://atcoder.jp/contests/abc079/tasks/abc079_c
ABCD = gets.chomp

for i in 0..((1<<3) -1) do
    tmp_sum = ABCD[0].to_i
    
    for j in 0..2 do
        num = ABCD[j+1].to_i
        tmp_sum += i[j] != 0 ? num : -1 * num
    end

    if tmp_sum == 7
        ans = ABCD[0]
        for j in 0..2 do
            ans += i[j] != 0 ? "+" : "-"
            ans += ABCD[j+1]
        end
        ans += "=7"

        puts ans
        exit
    end
end