PowerUp = Class{}
local GRAVITY = 50

function PowerUp:init(skin)
    -- simple positional and dimensional variables
    self.width = 8
    self.height = 8 
    
    self.x = math.random(VIRTUAL_WIDTH)
    self.y = 0

    self.dy = 0
    
    
    self.skin = math.random(3)

end

function PowerUp:update(dt)

    self.dy = self.dy + GRAVITY * dt
    self.y = self.dy

end

function PowerUp:collides(target)
    -- first, check to see if the left edge of either is farther to the right
    -- than the right edge of the other
    if self.x > target.x + target.width or target.x > self.x + self.width then
        return false
    end

    -- then check to see if the bottom edge of either is higher than the top
    -- edge of the other
    if self.y > target.y + target.height or target.y > self.y + self.height then
        return false
    end

    -- if the above aren't true, they're overlapping
    return true
end

function PowerUp:setSkin()
    if self.type == 'ball' then
        self.skin = 1
    else
        self.skin = 2
    end
end

function PowerUp:render()
    love.graphics.draw(gTextures['main'], gFrames['powerup'][self.skin], 
    self.x, self.y)
end
