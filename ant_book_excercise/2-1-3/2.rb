# https://atcoder.jp/contests/joi2011yo/tasks/joi2011yo_e
H, W ,N = gets.split(" ").map{ |s| s.to_i }
grid = Array.new(H){ gets.chomp.split("") }
ans = 0
sh = 0
sw = 0
for h in 0...H do
    for w in 0...W do
        if grid[h][w] == 'S'
            sh = h
            sw = w
        end
    end
end

N.times do |time|
    queue = [[sh, sw]]
    steps = Array.new(H){ Array.new(W, -1) }
    steps[sh][sw] = 0
    while !queue.empty? do
        x, y = queue.shift
        [[0,1], [0, -1], [1, 0], [-1, 0]].each do |i, j|
            nx = x + i
            ny = y + j
            next if !( nx >= 0 && nx < H) || !( ny >= 0 && ny < W)

            next if steps[nx][ny] > -1 || grid[nx][ny] == 'X'

            steps[nx][ny] = steps[x][y] + 1
            if grid[nx][ny] != '.' && grid[nx][ny] != 'S'
                num = grid[nx][ny].to_i
                if time+1 == num
                    ans += steps[nx][ny]
                    sh = nx
                    sw = ny
                    queue = []
                    break
                end
            end

            queue.push([nx, ny])
        end
    end
end

puts ans