Player = require('player')

function love.load()
    x, y, angle = love.graphics.getWidth()/2, love.graphics.getHeight()/2, math.pi/4
    player = Player:new("fill", x, y, 40, 20 , angle)
end 

function love.keypressed(key)
    if key == 'escape' then 
        love.event.quit()
    end 
end 

function love.draw()
    player:draw()
end 

function love.update(dt)
    if love.keyboard.isDown('a', 'left') then 
        player.angle = player.angle - player.speed * dt 
    elseif love.keyboard.isDown('d', 'right') then 
        player.angle = player.angle + player.speed * dt 
    end 

    if love.keyboard.isDown('up', 'w') then 
        player.x = player.x + math.cos(player.angle) * dt * player.speed * 10
        player.y = player.y + math.sin(player.angle) * dt * player.speed * 10
    end 
end