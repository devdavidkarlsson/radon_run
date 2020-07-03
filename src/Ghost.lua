---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by bloon.
--- DateTime: 7/2/2020 12:08 PM
---

Ghost = Class{}

local ghostHoverHeight = 5
local ghostFloatingHeight = 2

function Ghost:init(img, x, dyFromGround, rotation)
    self.image = img
    self.width = img:getWidth()
    self.height = img:getHeight()
    self.x = x

    local dy = dyFromGround or 0
    self.y = VIRTUAL_HEIGHT - gGraphics['ground']:getHeight() - self.height - dy - ghostHoverHeight
    self.rotation = rotation or 1
    self.isVisible = false
    self.isKilled = false

    self.dtotal = 0
    self.isFloatingUp = false
end

function Ghost:update(dt)
    if self.isVisible and self.isKilled then
        self.isVisible = false
        gStateMachine:change('ghostInfo', {
            image = self.image
        })
    else
        -- make ghost float up/down every 0.5 seconds
        self.dtotal = self.dtotal + dt
        if self.dtotal >= 0.5 then
            self.isFloatingUp = not(self.isFloatingUp)
            self.dtotal = 0
        end
    end
end

function Ghost:render()
    if self.isVisible and not(self.isKilled) then
        if self.isFloatingUp then
            love.graphics.draw(self.image, self.x, self.y + ghostFloatingHeight, 0, self.rotation, 1)
        else
            love.graphics.draw(self.image, self.x, self.y, 0, self.rotation, 1)
        end
    end
end

function Ghost:reset()
    self.isVisible = false
    self.isKilled = false
    self.dtotal = 0
end