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
    self.bullets = {}
    return self
end 

function Player:fire()
    local b = {}
    b.x = self.x 
    b.y = self.y
    b.r = 5
    b.a = self.angle
    table.insert(self.bullets, b)
end 

function Player:bulletMove(dt)
    for i, b in pairs(self.bullets) do 
        b.x = b.x + math.cos(b.a) * dt * self.speed * 20
        b.y = b.y + math.sin(b.a) * dt * self.speed * 20
        if b.x < 0 or b.x > love.graphics.getWidth() or b.y < 0 or b.y > love.graphics.getHeight() then
            self.bullets[i] = nil 
        end
    end 
end 

function Player:draw()
    love.graphics.push()
	love.graphics.translate(self.x, self.y)
	love.graphics.rotate( self.angle )
	love.graphics.polygon(self.mode, -self.length/2, -self.width /2, -self.length/2, self.width /2, self.length/2, 0)
	love.graphics.pop() 
    for i, b in pairs(self.bullets) do 
        love.graphics.circle('fill', b.x, b.y, b.r)    
    end 
end

return Player