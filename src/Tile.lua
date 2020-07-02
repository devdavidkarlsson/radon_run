---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by bloon.
--- DateTime: 7/2/2020 12:08 PM
---

Tile = Class{}

local heightScaleFactor = 0.25

function Tile:init(x, dyFromGround)
    self.image = gGraphics['tile']
    self.width = self.image:getWidth()
    self.height = self.image:getHeight() * heightScaleFactor
    self.x = x

    local dy = dyFromGround or 0
    self.y = VIRTUAL_HEIGHT - gGraphics['ground']:getHeight() - self.height - dy
end

function Tile:render()
    love.graphics.draw(self.image, self.x, self.y, 0, 1, heightScaleFactor)
end
