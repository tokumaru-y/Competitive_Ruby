# https://atcoder.jp/contests/abc085/tasks/abc085_c
N, Y = gets.to_s.split(" ").map{ |s| s.to_i }

for i in 0..N do
    for j in 0..N-i do
        x = 10_000 * i
        y = 5_000 * j
        left = Y - (x + y)
        
        next if left < 0

        z = left / 1_000
        next if z != N - i - j

        puts [i,j,z].join(" ")
        exit
    end
end

puts [-1,-1,-1].join(" ")