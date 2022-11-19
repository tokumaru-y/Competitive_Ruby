# https://atcoder.jp/contests/typical90/tasks/typical90_a
N, L = gets.chomp.split(" ").map{ |s| s.to_i }
K = gets.to_i
A = gets.chomp.split(" ").map{ |s| s.to_i }
A.push(L)

dif_list = Array.new
dif_list.push(A.first)

for i in 1..N do
    dif_list.push(A[i] - A[i-1])
end

def meet_condition?(assumed_score, dif_list, k)
    cut_count = 0
    tmp_sum = 0
 
    for i in 0...(dif_list.length-1) do
        v = dif_list[i]
        tmp_sum += v
        if tmp_sum >= assumed_score && cut_count < k
            cut_count += 1
            tmp_sum = 0
        end
    end

    tmp_sum += dif_list.last

    return (cut_count >= k && tmp_sum >= assumed_score)
end



left = 0
right = 10**9
while right - left > 1 do
    middle = (right + left) / 2
    if meet_condition?(middle, dif_list, K)
        left = middle
    else
        right = middle
    end
end

puts left