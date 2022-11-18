# https://atcoder.jp/contests/abc051/tasks/abc051_b
K, S = gets.to_s.split(" ").map{ |s| s.to_i }
ans = 0
for x in 0..K do
    for y in 0..K do
        if S - (x + y) >= 0 && S - (x + y) <= K
            ans += 1
        end
    end
end

puts ans