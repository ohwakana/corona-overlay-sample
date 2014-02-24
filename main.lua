-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar( display.HiddenStatusBar )
local storyboard = require ("storyboard")
storyboard.purgeOnSceneChange = true
storyboard.gotoScene( "stage" )
