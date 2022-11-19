# https://atcoder.jp/contests/abc002/tasks/abc002_4
N, M = gets.chomp.split(" ").map{ |s| s.to_i }
XY = Array.new(M).map{ gets.chomp.split(" ").map{ |s| s.to_i - 1 } }

ans = 0 

acceptable_table = Array.new(N){ Array.new(N, false)}
XY.each do |x,y|
    acceptable_table[x][y] = true
    acceptable_table[y][x] = true
end

for bit in 0...(1<<N) do
    tmp_member_cnt = 0
    member_list = Array.new

    for j in 0...N do
        if bit[j] == 1
            tmp_member_cnt += 1
            member_list.push(j)
        end
    end

    is_acceptable = true
    for i in 0...member_list.length do
        for j in i+1...member_list.length do
            if !acceptable_table[member_list[i]][member_list[j]]
                is_acceptable = false
            end
        end
    end

    if is_acceptable
        ans = [ans, tmp_member_cnt].max
    end
end

puts ans