require 'pad'
require 'ball'
require 'brick'
require 'startGame'

function love.load()
  -- Window size
  windowWidth = love.graphics.getWidth()
  windowHeight = love.graphics.getHeight()
  
  -- place pad to bottom
  pad.positionY = windowHeight - (pad.height / 2)
  
  -- place bricks
  brick.width = (windowWidth / 15)
  brick.height = 25
  
  -- start game
  start()
  
  print(brick.grid)
end


function love.update(dt)
  pad.positionX = love.mouse.getX()
  
  -- ball state
  if ball.sticky == true then
    ball.positionX = pad.positionX
    ball.positionY = pad.positionY - (ball.radius + (pad.height / 2))
  else
    ball.positionX = ball.positionX + (ball.speedX * dt)
    ball.positionY = ball.positionY - (ball.speedY * dt)
  end
  
  -- ball rebound
  if (ball.positionX + ball.radius) >= windowWidth then
    ball.speedX = -ball.speedX
    ball.positionX = (windowWidth - ball.radius)
  end
  
  if (ball.positionX - ball.radius) <= 0 then
    ball.speedX = -ball.speedX
    ball.positionX = (0 + ball.radius)
  end
  
  if (ball.positionY - ball.radius) <= 0 then
    ball.speedY = -ball.speedY
    ball.positionY = (0 + ball.radius)
  end
  
  if (ball.positionY + ball.radius) >= windowHeight then
    ball.sticky = true
  end
  
  if (ball.positionY + ball.radius) >= (pad.positionY - (pad.height / 2)) 
  and ball.positionX >= (pad.positionX - (pad.width / 2)) 
  and ball.positionX <= (pad.positionX + (pad.width / 2)) then
    ball.speedY = -ball.speedY
    ball.positionY = (pad.positionY - (pad.height / 2)) - ball.radius
  end
end


function love.draw()
  -- bricks grid
  local row
  local column
  
  brick.positionY = 0
  for row = 1, 6 do
    brick.positionX = 0
    for column = 1, 15 do
      if brick.grid[row][column] == 1 then
        love.graphics.rectangle('fill', brick.positionX + 2, brick.positionY + 2, brick.width - 4, brick.height - 4)
      end
      brick.positionX = (brick.positionX + brick.width)
    end
    brick.positionY = (brick.positionY + brick.height)
  end

  
  -- pad (origin center)
  love.graphics.rectangle('fill', pad.positionX - (pad.width / 2), pad.positionY - (pad.height / 2), pad.width, pad.height) 
  
  -- ball
  love.graphics.circle('fill', ball.positionX, ball.positionY, ball.radius)
end


function love.mousepressed(x, y, n)
  if ball.sticky == true then
    ball.sticky = false
    
    ball.speedX = 200
    ball.speedY = 200
  end
end