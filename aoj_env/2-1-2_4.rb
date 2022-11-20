# https://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=1160&lang=jp
while true
    $W, $H = gets.split(" ").map{ |s| s.to_i }
    exit if $W == 0 && $H == 0

    grid = Array.new($H){ gets.chomp.split(" ").map{ |s| s.to_i } }
    seen = Array.new($H){ Array.new($W, false) }
    ans = 0

    def dfs(x, y, grid, seen)
        [[-1,-1], [-1, 0], [-1, 1], [0, 1], [0, -1], [1, 0], [1, 1], [1, -1]].each do |i, j| 
            nx = x + i
            ny = y + j
            next if !(nx >= 0 && nx <$H ) || !(ny >= 0 && ny < $W)

            if !seen[nx][ny] && grid[nx][ny] == 1
                seen[nx][ny] = true
                dfs(nx, ny, grid, seen)
            end
        end
    end

    for h in 0...$H do
        for w in 0...$W do
            if grid[h][w] == 1 && !seen[h][w]
                seen[h][w] = true
                ans += 1
                dfs(h, w, grid, seen)
            end
        end
    end

    puts ans
end