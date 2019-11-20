require 'colors'

function love.load()

  snake = {}
  snake.size = 3
  snake.color = colors.green
  snake.width = 10
  snake.height = 10
  snake.direction = 'up'
  snake.cell = {}
  snake.cell[1] = {}
  snake.cell[1].x = 300
  snake.cell[1].y = 300
  snake.cell[2] = {}
  snake.cell[2].x = 300
  snake.cell[2].y = 310
  snake.cell[3] = {}
  snake.cell[3].x = 300
  snake.cell[3].y = 320

  apple = {}
  apple.width = 10
  apple.height = 10
  apple.color = colors.red
  apple.x = math.random(800-10)
  apple.y = math.random(600-10)
end

function love.update(dt)
  for i=snake.size,2,-1 do
    snake.cell[i].x = snake.cell[i-1].x
    snake.cell[i].y = snake.cell[i-1].y
  end
  if snake.direction == 'up' then
    snake.cell[1].y = snake.cell[1].y - 1
  elseif snake.direction == 'down' then
    snake.cell[1].y = snake.cell[1].y + 1
  elseif snake.direction == 'left' then
    snake.cell[1].x = snake.cell[1].x - 1
  elseif snake.direction == 'right' then
    snake.cell[1].x = snake.cell[1].x + 1
  end
  if (snake.cell[1].x - apple.y < 9 or snake.cell[1].x - apple.x > 9) and (snake.cell[1].y - apple.y < 9 or snake.cell[1].y - apple.y > 9) then
    snake.size = snake.size + 1
    snake.cell[snake.size] = {}
    snake.cell[snake.size].x = snake.cell[snake.size-1].x + 10 
    snake.cell[snake.size].y = snake.cell[snake.size-1].y + 10

    apple.x = math.random(800-10)
    apple.y = math.random(600-10)
  end
end

function love.draw()
  -- background
  love.graphics.setBackgroundColor(colors.black)

  -- cell
  love.graphics.setColor(snake.color)
  for i = 1, snake.size do
    love.graphics.rectangle("fill", snake.cell[i].x, snake.cell[i].y, snake.width, snake.height)
  end  
  -- apple
  love.graphics.setColor(apple.color)
  love.graphics.rectangle("fill", apple.x, apple.y, apple.width, apple.height)
end

function love.keypressed(key, scancode, isrepeat)
  if key == 'up' or key == 'down' or key == 'left' or key == 'right' then
    snake.direction = key
  end
end