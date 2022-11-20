# https://atcoder.jp/contests/arc037/tasks/arc037_b
N, M = gets.chomp.split(" ").map{ |s| s.to_i }
UV = Array.new(M){ gets.chomp.split(" ").map{ |s| s.to_i - 1 } }
graph = Array.new(N){ Array.new() }
seen = Array.new(N, false)
ans = 0

UV.each do |u, v|
    graph[u].push(v)
    graph[v].push(u)
end

def dfs(x, graph, seen, pre)

    res = true
    graph[x].each do | nx |

        if seen[nx] && nx != pre
            return false
        end

        next if seen[nx]
        
        seen[nx] = true
        res &= dfs(nx, graph, seen, x)
    end

    res
end

for i in 0...N do
    next if seen[i]
    
    seen[i] = true
    if dfs(i, graph, seen, -1)
        ans += 1
    end

end

puts ans