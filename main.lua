Player = require('player')
Enemy = require('enemy')

function love.load()
    x, y, angle = love.graphics.getWidth()/2, love.graphics.getHeight()/2, math.pi/4
    player = Player:new("fill", x, y, 40, 20 , angle)
    enemy = Enemy:new()
end 

function love.keypressed(key)
    if key == 'escape' then 
        love.event.quit()
    elseif key == 'space' then 
        --player:fire()
        enemy:create()
    end
end 

function love.draw()
    player:draw()
    enemy:draw()
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

    if player.x < 0 then 
        player.x = love.graphics.getWidth()
    elseif player.x > love.graphics.getWidth() then 
        player.x = 0
    end 

    if player.y < 0 then 
        player.y = love.graphics.getHeight()
    elseif player.y > love.graphics.getHeight() then 
        player.y = 0
    end

    player:bulletMove(dt)
end