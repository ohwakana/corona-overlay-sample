-----------------------------------------------------------------------------------------
--
-- stage.lua
--
-----------------------------------------------------------------------------------------
local storyboard = require ("storyboard")
local widget = require ("widget")
---------------------------------------
local scene = storyboard.newScene()

local PushBtn

local function onPushBtnRelease()
-- Overlay
	local options =
	{
	    effect = "fromBottom",
	    time = 400,
	    params =
	    {
	        result = "coronaSDK overlay sample"
	    },
	    isModal = "true"
	}
	storyboard.showOverlay( "result", options )
	return true
end

-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view

	PushBtn = widget.newButton{
		label= "Push",
		font = labelFont,
		labelColor = { default={1}, over={1} },
		defaultFile="images/button.png",
		overFile="images/button-over.png",
		width=153, height=35,
		onRelease = onPushBtnRelease
	}
	PushBtn:setReferencePoint( display.CenterReferencePoint )
	PushBtn.x = display.contentWidth*0.5
	PushBtn.y = display.contentHeight - 125

	group:insert( PushBtn )
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
	if PushBtn then
		PushBtn:removeSelf()	-- widgets must be manually removed
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
-----------------------------------------------------------------------------------------
-- OverLay
-- the following event is dispatched once the overlay is in place
function scene:overlayBegan( event )
    print( "Showing overlay: " .. event.sceneName )
end
scene:addEventListener( "overlayBegan" )

-- the following event is dispatched once overlay is removed
function scene:overlayEnded( event )
    print( "Overlay removed: " .. event.sceneName )
end
scene:addEventListener( "overlayEnded" )
-----------------------------------------------------------------------------------------
return scene


