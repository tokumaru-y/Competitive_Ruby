# https://atcoder.jp/contests/abc104/tasks/abc104_c
D,G = gets.chomp.split(" ").map{ |s| s.to_i }
PC = Array.new(D){ gets.chomp.split(" ").map{ |s| s.to_i } }

ans = Float::INFINITY

for i in 0...(1<<D) do
    tmp_sum_point = 0
    tmp_solve_cnt = 0
    
    for j in 0..D do
        if i[j] == 1
            cnt, bonus = PC[j]
            tmp_solve_cnt += cnt
            tmp_sum_point += cnt * 100 * (j+1) + bonus
        end
    end

    if tmp_sum_point >= G
        ans = [ans, tmp_solve_cnt].min
    else
        for j in (0...D).to_a.reverse do
            if i[j] != 1
                left_need_point = G - tmp_sum_point
                add_cnt = left_need_point / (100 * (j+1) )
                add_cnt += left_need_point % (100 * (j+1) ) > 0 ? 1 : 0
                
                if add_cnt < PC[j][0]
                    tmp_solve_cnt += add_cnt
                    ans = [ans, tmp_solve_cnt].min
                end

                break
            end 
        end
    end
end


puts ans