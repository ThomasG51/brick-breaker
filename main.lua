require 'pad'

function love.load()
  
  -- Window size
  windowWidth = love.graphics.getWidth()
  windowHeight = love.graphics.getHeight()
  
  -- place pad to bottom
  pad.positionY = windowHeight - pad.height
  
end


function love.update(dt)
  
  pad.positionX = love.mouse.getX() - (pad.width / 2)
  
end


function love.draw()
  love.graphics.rectangle('fill', pad.positionX, pad.positionY, pad.width, pad.height) 
end