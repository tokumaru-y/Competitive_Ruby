# https://atcoder.jp/contests/arc029/tasks/arc029_1
N = gets.chomp.to_i
T = Array.new(N) { gets.to_i }
ans = Float::INFINITY

arr = (0...N).to_a
while arr.length < 4 do
    arr.push(arr.length)
    T.push(0)
end
perm = arr.permutation.to_a

perm.each do |list|

    x = T[list[0]]
    y = T[list[1]]

    if x >= y
        y += T[list[2]]
    else
        x += T[list[2]]
    end

    if x >= y
        y += T[list[3]]
    else
        x += T[list[3]]
    end        

    need_time = x >= y ? x : y
    ans = [ans, need_time].min
end

puts ans