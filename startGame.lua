require 'ball'
require 'brick'

function start()
  ball.sticky = true
  
  brick.grid = {}
  
  local column
  local row
  
  for row = 1, 6 do
    brick.grid[row] = {}
    for column = 1, 15 do
      brick.grid[row][column] = 1
    end
  end

end