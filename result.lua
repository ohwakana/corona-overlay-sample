-----------------------------------------------------------------------------------------
--
-- result.lua
--
-----------------------------------------------------------------------------------------
local storyboard = require( "storyboard" )
local widget = require ("widget")
---------------------------------------
local scene = storyboard.newScene()

local ReloadBtn

local function onReloadBtnRelease(event)
	storyboard.gotoScene( "reload")
	return true
end

-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view
	local params = event.params

	-- display a background image
	local background = display.newImage( "images/backResult.png", true )
	background.x = display.contentWidth / 2
	background.y = display.contentHeight / 2

	ReloadBtn = widget.newButton{
		label= "Reload",
		labelColor = { default={1}, over={1} },
		defaultFile="images/button.png",
		overFile="images/button-over.png",
		width=153, height=35,
		onRelease = onReloadBtnRelease	-- event listener function
	}
	ReloadBtn:setReferencePoint( display.CenterReferencePoint )
	ReloadBtn.x = display.contentWidth / 2
	ReloadBtn.y = (display.contentHeight / 2) + 100

	local resultText = display.newText(params.result, 0, 0, native.systemFontBold, 16)
	resultText.x = display.contentWidth / 2
	resultText.y = (display.contentHeight / 2) - 120
	resultText:setTextColor(59, 59, 59)

	-- all display objects must be inserted into group
	group:insert( background )
	group:insert( ReloadBtn )
	group:insert( resultText )
end

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	
	-- INSERT code here (e.g. start timers, load audio, start listeners, etc.)
end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	-- INSERT code here (e.g. stop timers, remove listenets, unload sounds, etc.)
end

-- If scene's view is removed, scene:destroyScene() will be called just prior to:
function scene:destroyScene( event )
	local group = self.view

	if ReloadBtn then
		ReloadBtn:removeSelf()
		ReloadBtn = nil
	end
end

-----------------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
-----------------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched whenever before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )
-----------------------------------------------------------------------------------------

return scene
