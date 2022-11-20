# https://atcoder.jp/contests/abc007/tasks/abc007_3
H, W = gets.split(" ").map{ |s| s.to_i }
sx,sy = gets.split(" ").map{ |s| s.to_i - 1 }
gx, gy = gets.split(" ").map{ |s| s.to_i - 1 }
grid = Array.new(H){ gets.chomp.split("") }
queue = [[sx, sy]]
steps = Array.new(H){ Array.new(W, -1) }
steps[sx][sy] = 0
while !queue.empty? do
    x, y = queue.shift
    [[0,1], [0, -1], [1, 0], [-1, 0]].each do |i, j|
        nx = x + i
        ny = y + j
        next if !( nx >= 0 && nx < H) || !( ny >= 0 && ny < W)
        next if steps[nx][ny] > -1 || grid[nx][ny] == '#'
        steps[nx][ny] = steps[x][y] + 1
        queue.push([nx, ny])
    end
end

puts steps[gx][gy]