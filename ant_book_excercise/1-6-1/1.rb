# https://atcoder.jp/contests/arc004/tasks/arc004_1
N = gets.to_i
XY = Array.new(N){ gets.to_s.split(" ").map{ |s| s.to_i } }
ans = 0

XY.each do |x , y|
    XY.each do |a, b|
        next if x == a && y == b
        distance = Math.sqrt( (x - a)** 2 + (y - b)** 2 )
        ans = [ans, distance].max
    end
end

puts ans