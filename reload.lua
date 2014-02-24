-----------------------------------------------------------------------------------------
--
-- reload.lua
--
-----------------------------------------------------------------------------------------
local storyboard = require ("storyboard")
---------------------------------------
local scene = storyboard.newScene()

local loadText

local function restartScene (event)
	storyboard.removeScene("stage")
	storyboard.gotoScene ("stage", {time=400, effect= "fade"})
end

-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view

	loadText = display.newText("loading......", 0, 0 , native.systemFontBold, 16)
	loadText.x = display.contentWidth * 0.5
	loadText.y = display.contentHeight * 0.5

	group:insert (loadText)
end

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	-- INSERT code here (e.g. start timers, load audio, start listeners, etc.)
 
	loadText.alpha = 1.0
	transition.to( loadText, {time=250, alpha = 0.0, onComplete=restartScene} )
end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	
	-- INSERT code here (e.g. stop timers, remove listenets, unload sounds, etc.)
end

-- If scene's view is removed, scene:destroyScene() will be called just prior to:
function scene:destroyScene( event )
	local group = self.view
	if PushBtn then
		PushBtn:removeSelf()
		PushBtn = nil
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


