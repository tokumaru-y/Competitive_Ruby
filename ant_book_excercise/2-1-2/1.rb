# https://atcoder.jp/contests/atc001/tasks/dfs_a
$H, $W = gets.split(" ").map{ |s| s.to_i }
grid = Array.new($H){ gets.chomp.split("") }

start_x = -1
start_y = -1
seen = Array.new($H){ Array.new($W, false) }

for h in 0...$H do
    for w in 0...$W do
        if grid[h][w] == 's'
            start_x = h
            start_y = w
        end
    end
end

def dfs(x, y, grid, seen)
    if grid[x][y] == 'g'
        return true
    end

    reachable = false
    [[1,0], [-1,0], [0,1], [0,-1]].each do | i, j|
        nx = x + i
        ny = y + j
        if !(nx >= 0 && nx < $H) || !(ny >= 0 && ny < $W)
            next
        end

        next if seen[nx][ny] || grid[nx][ny] == '#'

        seen[nx][ny] = true
        reachable |=  dfs(nx, ny, grid, seen)
    end

    reachable
end

seen[start_x][start_y] = true

puts dfs(start_x, start_y, grid, seen) ? "Yes" : "No"