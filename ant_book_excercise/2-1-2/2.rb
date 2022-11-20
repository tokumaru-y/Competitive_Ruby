# https://atcoder.jp/contests/arc031/tasks/arc031_2
grid  = Array.new(10){ gets.chomp.split("") }

def dfs(x, y, grid, seen)
    [[1,0], [-1, 0], [0, 1], [0, -1]].each do |i, j|
        nx = x + i
        ny = y + j
        next if !(nx >= 0 && nx < 10) || !(ny >= 0 && ny < 10)
        next if seen[nx][ny] || grid[nx][ny] == 'x'

        seen[nx][ny] = true
        dfs(nx, ny, grid, seen)
    end
end

def meet_condition?(grid, seen)

    for h in 0...10 do
        for w in 0...10 do
            if grid[h][w] == 'o' && !seen[h][w]
                return false
            end
        end
    end

    true
end

reachable = false

for h in 0...10 do
    for w in 0...10 do
        if grid[h][w] == 'x'
            add_island_grid = Marshal.dump(grid)
            add_island_grid = Marshal.load(add_island_grid)
            add_island_grid[h][w] = 'o'
            seen = Array.new(10){ Array.new(10, false) }
            seen[h][w] = true
            dfs(h, w, add_island_grid, seen)

            reachable |= meet_condition?(add_island_grid, seen)
        end
    end
end

puts reachable ? "YES" : "NO"