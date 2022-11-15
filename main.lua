
function love.load()
end 

function love.keypressed(key)
    if key == 'escape' then 
        love.event.quit()
    end 
end 

function triangle (mode, x, y, length, width , angle) -- position, length, width and angle
	love.graphics.push()
	love.graphics.translate(x, y)
	love.graphics.rotate( angle )
	love.graphics.polygon(mode, -length/2, -width /2, -length/2, width /2, length/2, 0)
	love.graphics.pop() 
end

function love.draw()
    x, y, angle = 200, 100, math.pi/4
    triangle ("fill", x, y, 20, 10 , angle)
end 