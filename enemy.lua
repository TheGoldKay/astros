Enemy = {}
Enemy.__index = Enemy

function Enemy:new() 
    self = setmetatable({}, self)
    self.rmin = 5
    self.rmax = 50
    self.list = {}
    self:create()
    return self
end

function Enemy:create()
    local r = love.math.random(self.rmin, self.rmax)
    local x = love.math.random(r, love.graphics.getWidth())
    local y = love.math.random(r, love.graphics.getHeight())
    table.insert(self.list, {r=r, x=x, y=y})
end

function hexadecagon (mode, x, y, radius) -- same as love.graphics.circle
	local w1, w2 = math.atan(0.21), math.atan(0.72) -- magic values
	local a = radius
	local b = radius*math.sin (w1)
	local c = radius*math.cos (w2)
	local d = radius*math.sin (w2)
    local t = 0.1
	local vertices = {
		 a, b,  c, d,  d, c,  b, a, 
		-b, a, -d, c, -c, d, -a, b, 
		-a,-b, -c,-d, -d,-c, -b,-a, 
		 b,-a,  d,-c,  c,-d,  a,-b}
	love.graphics.translate (x+t, y+t)
	love.graphics.polygon (mode, vertices)
	love.graphics.translate (-x-t, -y-t)
end

function Enemy:draw()
    for _, circle in ipairs(self.list) do 
        --love.graphics.circle('line', circle.x, circle.y, circle.r)
        hexadecagon('line', circle.x, circle.y, circle.r)
    end
end


return Enemy