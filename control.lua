require("defines")

-- Create our button
local button
game.oninit(function()
		button = game.player.gui.left.add{type="button", name="toggleFlyingBoots", caption="Takeoff"}
end)

-- Listen for out button click
isFlying = false
game.onevent(defines.events.onguiclick, function(event)
  if event.element.name == "toggleFlyingBoots" then
    if not isFlying then
      game.player.print('Taking off...')
      takeoff()
    else
      game.player.print('Landing...')
      land()
    end
    isFlying = not isFlying
  end
end)

-- Takeoff
local character
function takeoff()
  -- Set caption
  game.player.gui.left.toggleFlyingBoots.caption = "Land"

  -- Save character
  character = game.player.character

  -- Set character to nil to start ghost mode
  game.player.character = nil
end

-- Land
function land()
  -- Set caption
  game.player.gui.left.toggleFlyingBoots.caption = "Takeoff"

  -- Save current position
  dest = game.player.position

  -- Reset original character
  game.player.character = character

  -- Teleport to last flying position
  game.player.teleport(dest)
end

