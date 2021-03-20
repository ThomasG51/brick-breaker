require 'pad'
require 'ball'
require 'startGame'

function love.load()
  
  -- Window size
  windowWidth = love.graphics.getWidth()
  windowHeight = love.graphics.getHeight()
  
  -- place pad to bottom
  pad.positionY = windowHeight - (pad.height / 2)
  
  -- start game
  start()
end


function love.update(dt)
  
  pad.positionX = love.mouse.getX()
  
  -- stick ball to the pad
  if ball.sticky == true then
    ball.positionX = pad.positionX
    ball.positionY = pad.positionY - (ball.radius + (pad.height / 2))
  end

end


function love.draw()
  -- pad (origin center)
  love.graphics.rectangle('fill', pad.positionX - (pad.width / 2), pad.positionY - (pad.height / 2), pad.width, pad.height) 
  
  -- ball
  love.graphics.circle('fill', ball.positionX, ball.positionY, ball.radius)
end