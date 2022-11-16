Player = {}
Player.__index = Player


function Player:new (mode, x, y, length, width , angle) -- position, length, width and angle
	self = setmetatable({}, self)
    self.mode = 'fill'
    self.x = x 
    self.y = y 
    self.length = length
    self.width = width
    self.angle = angle 
    self.speed = 5
    return self
end 

function Player:draw()
    --love.graphics.push()
	love.graphics.translate(self.x, self.y)
	love.graphics.rotate( self.angle )
	love.graphics.polygon(self.mode, -self.length/2, -self.width /2, -self.length/2, self.width /2, self.length/2, 0)
	--love.graphics.pop() 
end

return Player