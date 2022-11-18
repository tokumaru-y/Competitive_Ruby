# https://www.ioi-jp.org/joi/2007/2008-ho-prob_and_sol/2008-ho.pdf#page=6
N, M = gets.to_s.split(" ").map{ |s| s.to_i }
P = Array.new(N){ gets.to_s.to_i }
point_array = [];
for i in 0..N do
    for j in 0..N-1 do
        x = i == N ? 0 : P[i]
        y = P[j]
        point_array.push(x+y)
    end
end

point_array.push(0)
point_array.sort!

ans = 0
for i in 0..(point_array.length-1) do
    next if point_array[i] > M

    target_index = point_array.bsearch_index{ |v| v >= M - point_array[i] }

    next if target_index == nil
    if target_index == 0
        ans = [ans, point_array[i]].max
    else
        compare_number = point_array[i] + point_array[target_index] == M ? M : point_array[i] + point_array[target_index - 1]
        ans = [ans, compare_number].max
    end
end

puts ans