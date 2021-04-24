-- Shell Screen template, associated code.

-- Some tuning values
gShellAnimTime = 0.4 -- default on animations if not specified

gPrevMovie = nil
gMovieAlwaysPlay = nil

-- Helper array. Turns a StateVoice icon into UV coords.
-- Values for what the StateIcon/VoiceIcon will be. From xbOnline.h:
--0     ONLINEICON_NONE = 0,                   // No icon
--1     ONLINEICON_FRIEND_ONLINE,              // Friend is online
--2     ONLINEICON_FRIEND_RECEIVEDREQUEST,     // Friend request received
--3     ONLINEICON_FRIEND_SENTREQUEST,         // Friend request sent
--4     ONLINEICON_FRIEND_RECEIVEDINVITE,      // Game invite from friend
--5     ONLINEICON_FRIEND_SENTINVITE,          // Game invite to friend
--6     ONLINEICON_PLAYER_VOICE,               // Player has voice capability        
--7     ONLINEICON_PLAYER_MUTED,               // Player has been muted
--8     ONLINEICON_PLAYER_TVCHAT,              // TV Chat -  no voice comm.               
-- See page 22-23 of xboxliverecUI.pdf for the mapping of what
-- these should look like. These are mapped out of lobby_icons.tga
gXLFriendsEnum2UVs = {
	{ u=0.75, v=0.75,}, -- ONLINEICON_NONE
	{ u=0.5 , v=0.25,}, -- ONLINEICON_FRIEND_ONLINE
	{ u=0.0 , v=0.25,}, -- ONLINEICON_FRIEND_RECEIVEDREQUEST
	{ u=0.25, v=0.25,}, -- ONLINEICON_FRIEND_SENTREQUEST
	{ u=0.0 , v=0.5 ,}, -- ONLINEICON_FRIEND_RECEIVEDINVITE
	{ u=0.25, v=0.5 ,}, -- ONLINEICON_FRIEND_SENTINVITE
	{ u=0.25, v=0.0 ,}, -- ONLINEICON_PLAYER_VOICE
	{ u=0.75, v=0.0 ,}, -- ONLINEICON_PLAYER_MUTED
	{ u=0.0 , v=0.0 ,}, -- ONLINEICON_PLAYER_TVCHAT
	{ u=0.5 , v=0.0 ,}, -- ONLINEICON_PLAYER_VOICE2
}

-- Starts a movie. Does nothing if already playing.  It's safe to omit
-- left/top/width/height if fullscreen is true.
function ifelem_shellscreen_fnStartMovie(movieName, loop, nextMovieName, fullscreen, left, top, width, height)
	
	if (movieName and not gMovieDisabled and 
			(gMovieAlwaysPlay or 
			 (not ScriptCB_IsMetagameStateSaved() and
				not ScriptCB_IsSPStateSaved()))) then
		-- setup full screen parameters
		if (fullscreen) then
			local right, bottom, b, w = ScriptCB_GetScreenInfo()
			if (fullscreen == 2) then
				-- fully visible in widescreen with bars on either side
				left   = right * (1 - 1/w) * 0.5
				top    = bottom * (1 - 1/w) * 0.5
				width  = right/w
				height = bottom/w
			else
				left   = 0
				top    = 0
				width  = right  - left
				height = bottom - top
			end
		end
		
		-- is another movie specified
		if (not nextMovieName) then
			nextMovieName = ""
		end

		print("+++ ifelem_shellscreen_fnStartMovie:", movieName )
		
		-- if the movie isn't currently playing     
		if (not ScriptCB_AreMoviePropertiesPlaying(movieName)) then
			-- play it
			ScriptCB_PlayMovie(movieName, loop, nextMovieName, left, top, width, height)
		end    
	else
		gPrevMovie = movieName
	end
end

-- plays a sound
function ifelm_shellscreen_fnPlaySound(sound)
	if (sound) then 
		--print("PLAYSOUND " .. sound)
		ScriptCB_SndPlaySound(sound)
	end
end

-- 
function ifelem_shellscreen_fnPostError(this,bUserHitYes,ErrorLevel,ErrorMessage)
	print("Default fnPostError(..,",bUserHitYes,ErrorLevel)
	if(ErrorLevel >= 6) then
		ScriptCB_PopScreen()
	end
end

-- Stops a movie, if playing.
function ifelem_shellscreen_fnStopMovie()
	if (not gMovieDisabled) then
		if (ScriptCB_IsMoviePlaying()) then
			ScriptCB_StopMovie()
		end
	end
end

function gIFShellScreenTemplate_CommonUpdate(this, fDt)
	local ErrorLevel,ErrorMessage = ScriptCB_GetLatestError()
	if(ErrorLevel > 0) then
		ScriptCB_OpenErrorBox(ErrorLevel,ErrorMessage)
		if(Popup_Busy) then
			ScriptCB_IFObj_SetAlpha(Popup_Busy.cpointer,0) -- hide it
		end
	end
	
	-- every so often, flash one of the interface elements
	if( not this.nextFlashyTime or this.nextFlashyTime <= 0 ) then
		IFFlashyText_DoRandomFlashiness(this)
		this.nextFlashyTime = random() * 15 + 10
	end
	this.nextFlashyTime = this.nextFlashyTime - fDt
	
	if(this.buttons and this.buttons.FriendIcon and ScriptCB_GetFriendListIcon) then
		this.nextFriendIconUpdate = this.nextFriendIconUpdate - fDt
		if(this.nextFriendIconUpdate < 0) then
			this.nextFriendIconUpdate = 0.25 -- 1/4 second between updates
			local IconIdx = ScriptCB_GetFriendListIcon()
			local UVs = gXLFriendsEnum2UVs[IconIdx+1] -- lua counts from 1
			IFImage_fnSetUVs(this.buttons.FriendIcon,UVs.u,UVs.v,UVs.u+0.25,UVs.v+0.25)
		end
	end

	ScriptCB_UpdateScreen()
end

-- Default for update function
function gIFShellScreenTemplate_fnUpdate(this, fDt)
	AnimationMgr_Update(fDt) -- always call this.

	local Button_CurSizeAdd = gButton_CurSizeAdd
	local Button_CurDir = gButton_CurDir

	if(gCurHiliteButton) then
		IFButton_fnHilight(gCurHiliteButton,1,fDt)
	end
	
	if(gCurHiliteButton2) then
		-- Restore entry values so we don't go at double-speed.
		gButton_CurSizeAdd = Button_CurSizeAdd
		gButton_CurDir = Button_CurDir
		IFButton_fnHilight(gCurHiliteButton2,1,fDt)
	end

	local Listbox_CurSizeAdd = gListbox_CurSizeAdd
	local Listbox_CurDir = gListbox_CurDir
	
	if(gCurEditbox) then
		IFEditbox_fnBounceCursor(gCurEditbox,fDt)
	end

	if(gCurHiliteListbox) then
		ListManager_fnHilight(gCurHiliteListbox,fDt)
	end
	if(gCurHiliteListbox2) then
		-- Restore entry values so we don't go at double-speed.
		gListbox_CurSizeAdd = Listbox_CurSizeAdd
		gListbox_CurDir = Listbox_CurDir
		ListManager_fnHilight(gCurHiliteListbox2,fDt)
	end

	gIFShellScreenTemplate_CommonUpdate(this, fDt)
end

-- Helper function for right-justified icon + text containers. Each
-- container must have a .icon and a .helpstr field.
function gIFShellScreenTemplate_fnMoveIcon(Container)
	local fLeft, fTop, fRight, fBot
	fLeft, fTop, fRight, fBot = ScriptCB_IFText_GetDisplayRect(Container.helpstr.cpointer)
	local TextW = fRight - fLeft + 10
	IFImage_fnSetTexturePos(Container.icon,-TextW - 20, -10, -TextW, 10)
end

--same as above but for a clickable button
function gIFShellScreenTemplate_fnMoveClickableButton(ObjToMove,TextToGetWidthFrom,xAdd)
	local fLeft, fTop, fRight, fBot
	fLeft, fTop, fRight, fBot = ScriptCB_IFText_GetDisplayRect(TextToGetWidthFrom.cpointer)
	IFObj_fnSetPos(ObjToMove,xAdd+50-(fRight - fLeft),ObjToMove.y)
end
--centers the clickable button
function gIFShellScreenTemplate_fnCenterClickableButton(ObjToMove,TextToGetWidthFrom,xAdd,string)
	local fLeft, fTop, fRight, fBot
	fLeft, fTop, fRight, fBot = ScriptCB_IFText_GetDisplayRect(TextToGetWidthFrom.cpointer)
	IFObj_fnSetPos(ObjToMove,xAdd-(fRight - fLeft)/2,ObjToMove.y)
	ScriptCB_IFObj_CreateHotSpot(TextToGetWidthFrom.cpointer)
	ScriptCB_IFText_SetTextBox(TextToGetWidthFrom.cpointer,(fRight-fLeft),(fBot-fTop))
	IFText_fnSetString(TextToGetWidthFrom,string)
end


-- Default for enter function
function gIFShellScreenTemplate_fnEnter(this, bFwd)
	if(this.Helptext_Accept) then
		gIFShellScreenTemplate_fnMoveIcon(this.Helptext_Accept)
	end

	if(this.buttons) then
		AnimationMgr_AddAnimation(this.buttons, { fStartAlpha = 0, fEndAlpha = 1,})
	end
	if(this.listbox and (not this.listbox.noEnterAnimation)) then
		AnimationMgr_AddAnimation(this.listbox, { fStartAlpha = 0, fEndAlpha = 1,})
	end
	if(this.title) then
		AnimationMgr_AddAnimation(this.title, { fStartAlpha = 0, fEndAlpha = 1,})
	end

	-- start flashiness for all the text elements
	IFFlashyText_StartFlashiness(this)	
	

	gCurScreenStr = this.ScreenName -- e.g. "ifs_main"
	gCurScreenTable = this

	-- Set currently hilighted button to whatever this screen was
	if(this.buttons and this.CurButton) then
		gCurHiliteButton = this.buttons[this.CurButton]
		if(gCurHiliteButton) then
			IFButton_fnSelect(gCurHiliteButton,1) -- make sure texture changesb
			IFButton_fnHilight(gCurHiliteButton,1,0)  -- hilight it, dt = 0
		end
	end
	
	if (bFwd) then
		ifelm_shellscreen_fnPlaySound(this.enterSound);
	else
		ifelm_shellscreen_fnPlaySound(this.exitSound);
	end
	
	if (this.music) then
		if (this.music == "STOP") then
			ScriptCB_SetShellMusic()
		else
			ScriptCB_SetShellMusic(this.music)
		end
	end
	
	ifelem_shellscreen_fnStartMovie(this.movieBackground, 1, nil, 1)
end

-- Default for exit function
function gIFShellScreenTemplate_fnLeave(this, bFwd)
	if(gCurHiliteButton) then
		IFButton_fnHilight(gCurHiliteButton,nil,0) -- unhilight it
		gCurHiliteButton = nil -- clear this.
	end
	
	gCurHiliteListbox = nil -- clear this also
end

-- On top of gIFScreenTemplate, does a nice background for the shell.
gIFShellScreenTemplate = {
	bg = NewIFImage { 
		ScreenRelativeX = 0,
		ScreenRelativeY = 0,
		UseSafezone = 0,
		ZPos = 255, -- behind all.

		texture = "logo", 
		localpos_l = 0,
		localpos_t = 0,
		-- Size, UVs aren't fully specified here, but in NewIFShellScreen()
		inert = 1, -- Delete this out of lua once created (we'll never touch it again)
	},

	enterSound      = "",                    -- played when the screen is entered forwards
	exitSound       = "shell_menu_exit",     -- played when the screen is entered backwards
	acceptSound     = "shell_menu_accept",   -- played when an option is accepted
	cancelSound     = "shell_menu_cancel",   -- played when settings are cancelled
	errorSound      = "shell_menu_error",    -- played when the selection is an error
	selectSound     = "shell_select_change", -- played when menu selection changes
	movieIntro      = nil,                   -- played before the screen is displayed
	movieBackground = nil,                   -- played while the screen is displayed
	music           = nil,                   -- music for the screen, setting this value to 
	-- "STOP" stops background music for this screen
	
	

	-- bWasAcceptOnBack will be non-nil when the user hit the accept
	-- button on the "Back" button. Probably most useful in determining
	-- which sfx to play.
	Input_Back = function(this,bFromButtonPress)
								 ScriptCB_PopScreen()
							 end,

	Enter = gIFShellScreenTemplate_fnEnter,
	Leave = gIFShellScreenTemplate_fnLeave,
	Update = gIFShellScreenTemplate_fnUpdate,
	fnPostError = ifelem_shellscreen_fnPostError,

	HandleMouse = function(this, fMouseX, fMouseY)
		gHandleMouse(this,fMouseX,fMouseY)
	end
}

-- temp hackage for bg screens on pc
-- no longer needed once all references are removed
function HackBGTextureOnPCOnly(texture)
	return nil
end
-- end hackage

function NewIFShellScreen_common(temp,Template)
	if(Template.bg_texture and (ScriptCB_GetShellActive())) then
		temp.bg.texture = Template.bg_texture
 		-- Ask game for screen size, fill in values
 		local r,b,v,w
 		r,b,v,w=ScriptCB_GetScreenInfo()
 		temp.bg.localpos_r = r * w
 		temp.bg.localpos_b = b
 		temp.bg.uvs_b = v
	else
		temp.bg = nil
	end

	-- Add a friends icon if requested. Screen is responsible for moving it
	-- later.
	if(Template.bFriendsIcon) then
		local IconSize = 36

		temp.buttons.FriendIcon = NewIFImage { 
			texture = "lobby_icons", 
			localpos_l = 0, localpos_t = 0, 
			localpos_b = IconSize, localpos_r = IconSize,
			bInertPos = 1,
			ZPos = 10, -- on top of almost everything
		}
		temp.nextFriendIconUpdate = 0 -- update ASAP on entry
	end

	-- Helptext icons show up only on consoles
	if(gPlatformStr ~= "PC") then
		if((not Template.bNohelptext) and (not Template.bNohelptext_back)) then
			temp.Helptext_Back = NewIFContainer {
				ScreenRelativeX = 0.0, -- left
				ScreenRelativeY = 1.0, -- bottom
				y = -15, -- just above bottom
				x = 0,
				
				icon = NewIFImage { 
					ZPos = 200, -- behind most.
					
					texture = "btnb", 
					localpos_l = 0,
					localpos_t = -11,
					localpos_r = 20,
					localpos_b = 11,
					inert = 1, -- Delete this out of lua once created (we'll never touch it again)
				},

				helpstr = NewIFText {
					string = "common.back",
					font = "gamefont_medium",
					textw = 460,
					x = 25,
					y = -15,
					halign = "left",
					nocreatebackground = 1,
				},
			} -- end of Helptext_Back
		end -- should have a back icon

		if((not Template.bNohelptext) and (not Template.bNohelptext_accept)) then
			temp.Helptext_Accept = NewIFContainer {
				ScreenRelativeX = 1.0, -- right
				ScreenRelativeY = 1.0, -- bottom
				y = -15, -- just above bottom of screen
				x = 0,

				icon = NewIFImage { 
					ZPos = 200, -- behind most.

					texture = "btna", 
					localpos_l = -10,
					localpos_t = -11,
					localpos_r = 10,
					localpos_b = 11,
				},

				helpstr = NewIFText {
					string = "common.accept",
					font = "gamefont_medium",
					textw = 460,
					x = -460,
					y = -15,
					halign = "right",
					nocreatebackground = 1,
				},
			}
		end  -- should have an accept icon
	else -- this is a PC build
		if((not Template.bNohelptextPC) and (not Template.bNohelptext_backPC)) then
			local BackButtonW = 130 -- made 130 to fix 6198 on PC - NM 8/18/04
			local BackButtonH = 25

			temp.Helptext_Back =	NewIFContainer {
				ScreenRelativeX = 0.0, -- left
				ScreenRelativeY = 1.0, -- bottom
				y = -15, -- just above bottom
				x = 60,

				btn = NewClickableIFButton {
					btnw = BackButtonW, 
					btnh = BackButtonH,
					font = "gamefont_medium", 
					bg_tail = 20,
					nocreatebackground = 1,
					tag = "_back",
				}, -- end of btn
			} -- end of Helptext_Back
			
			RoundIFButtonLabel_fnSetString(temp.Helptext_Back.btn,"common.back")
		end -- should have a back icon
	end 
end

-- Wrapper around NewIFScreen, makes a shell-screen w/ fancy
-- background, etc.
function NewIFShellScreen(Template)
	local temp = createObj(gIFShellScreenTemplate, Template)
	temp.type = "screen"

	NewIFShellScreen_common(temp,Template)

	return createObj(gIFScreenTemplate , temp)
end

-- Default for update function
function gIFShellScreenTemplate2_fnUpdate(this, fDt)
	AnimationMgr_Update(fDt) -- always call this.

	if(gCurHiliteButton2) then
		IFButton_fnHilight(gCurHiliteButton2,1,fDt)
	end
	if(gCurHiliteListbox2) then
		ListManager_fnHilight(gCurHiliteListbox2,fDt)
	end

	gIFShellScreenTemplate_CommonUpdate(this, fDt)
end

-- Default for enter function
function gIFShellScreenTemplate2_fnEnter(this)
	if(this.buttons) then
		AnimationMgr_AddAnimation(this.buttons, { fStartAlpha = 0, fEndAlpha = 1,})
	end
	if(this.listbox) then
		AnimationMgr_AddAnimation(this.listbox, { fStartAlpha = 0, fEndAlpha = 1,})
	end
	if(this.title) then
		AnimationMgr_AddAnimation(this.title, { fStartAlpha = 0, fEndAlpha = 1,})
	end

	-- Set currently hilighted button to whatever this screen was
	if(this.CurButton) then
		gCurHiliteButton2 = this.buttons[this.CurButton]
		if(gCurHiliteButton2) then
			IFButton_fnSelect(gCurHiliteButton2,1) -- make sure texture changesb
			IFButton_fnHilight(gCurHiliteButton2,1,0)  -- hilight it, dt = 0
		end
	end
end

-- Default for enter function
function gIFShellScreenTemplate2_fnLeave(this)
	if(gCurHiliteButton2) then
		IFButton_fnHilight(gCurHiliteButton2,nil,0) -- unhilight it
		gCurHiliteButton2 = nil -- clear this.
	end
	gCurHiliteListbox2 = nil -- clear this also
end

-- On top of gIFScreenTemplate, does a nice background for the shell.
gIFShellScreenTemplate2 = {
	-- bWasAcceptOnBack will be non-nil when the user hit the accept
	-- button on the "Back" button. Probably most useful in determining
	-- which sfx to play.
	Input_Back = function(this,bFromButtonPress)
		ScriptCB_PopScreen()
	end,

	Enter = gIFShellScreenTemplate2_fnEnter,
	Leave = gIFShellScreenTemplate2_fnLeave,
	Update = gIFShellScreenTemplate2_fnUpdate,
	fnPostError = ifelem_shellscreen_fnPostError,

	HandleMouse = function(this, fMouseX, fMouseY)
		gHandleMouse(this,fMouseX,fMouseY)
	end
}

-- Given a container, current button (string), and a direction string
-- to follow ("link_up" | "link_down" | "link_left" | "link_right),
-- tries to find the next button. If that's set, it deactivates the
-- old one, activates the new. Returns the string index of the new
-- button, or CurrentStr if links were invalid (or unavailable)

function FollowButtonLink(container,CurrentStr,DirStr)

    local EntrySelectedTable = nil
	local NewBtnStr = nil
	
	if(not CurrentStr) then
		NewBtnStr = container.TagOfFirst
		EntrySelectedTable  = container[container.TagOfFirst]
	else
		EntrySelectedTable  = container[CurrentStr]
		-- Button selected on entry
		
		-- Last button in the chain, used to skip thru hidden buttons
		local LastBtnTable = EntrySelectedTable
		local bKeepGoing

		repeat
			bKeepGoing = nil
			NewBtnStr = LastBtnTable[DirStr]
			if(NewBtnStr) then
				bKeepGoing = (NewBtnStr ~= CurrentStr) and 
					(container[NewBtnStr].hidden or (not IFObj_fnGetVis(container[NewBtnStr])))

				if(bKeepGoing) then
					LastBtnTable = container[NewBtnStr]
				end
	
			end
		until (bKeepGoing == nil)
	end

	if(NewBtnStr) then
		ScriptCB_SndPlaySound("shell_select_change")
		IFButton_fnSelect(EntrySelectedTable,nil) -- Deactivate old button
		IFButton_fnSelect(container[NewBtnStr],1) -- show new one.
		return NewBtnStr
	else
		return CurrentStr -- Go nowhere if link doesn't work.
	end
end

-- Mouse-helper functions. These return a bool as to whether they did
-- all the work or not
function gShellScreen_fnDefaultInputAccept(this, bSkipListBox)
	if(gMouseListBoxSlider) then
		ListManager_fnScrollbarClick(gMouseListBoxSlider)
		return 1 -- note we did all the work
	end

	-- Clicking on editboxes does zilch (clicks outside of current
	-- editbox are ignored
	if((gCurEditbox) and (gCurEditbox.bMouseover)) then
		return 1 -- note we did all the work
	end

	if(bSkipListBox == nil and gMouseListBox) then
		ScriptCB_SndPlaySound("shell_select_change")
		gMouseListBox.Layout.SelectedIdx = gMouseListBox.Layout.CursorIdx
		ListManager_fnFillContents(gMouseListBox,gMouseListBox.Contents,gMouseListBox.Layout)
		return 1 -- note we did all the work
	end
	
	if((this.CurButton) and (this.CurButton == "_back")) then
		this:Input_Back()
		return 1 -- note we did all the work
	end
	
	return nil -- didn't do any work
end

function gShellScreen_fnDefaultInputUp(this)
	-- Clicking on editboxes does zilch
	if(gCurEditbox) then
		return 1 -- note we did all the work
	end

	if(gMouseListBox) then
		ListManager_fnNavUp(gMouseListBox,gMouseListBox.Contents,gMouseListBox.Layout)
		return 1 -- note we did all the work
	end

	return nil -- didn't do any work
end

function gShellScreen_fnDefaultInputDown(this)
	-- Clicking on editboxes does zilch
	if(gCurEditbox) then
		return 1 -- note we did all the work
	end

	if(gMouseListBox) then
		ListManager_fnNavDown(gMouseListBox,gMouseListBox.Contents,gMouseListBox.Layout)
		return 1 -- note we did all the work
	end

	return nil -- didn't do any work
end

-- For button presses, follow link if applicable, activate as necessary
function gDefault_Input_GeneralUp(this)
	-- If base class handled this work, then we're done
	if(gShellScreen_fnDefaultInputUp(this)) then
		return
	end

	this.CurButton = FollowButtonLink(this.buttons,this.CurButton,"link_up")
	gCurHiliteButton = this.buttons[this.CurButton]
end

function gDefault_Input_GeneralDown(this)
	-- If base class handled this work, then we're done
	if(gShellScreen_fnDefaultInputDown(this)) then
		return
	end

	this.CurButton = FollowButtonLink(this.buttons,this.CurButton,"link_down")
	gCurHiliteButton = this.buttons[this.CurButton]
end

function gDefault_Input_GeneralRight(this)
	this.CurButton = FollowButtonLink(this.buttons,this.CurButton,"link_right")
	gCurHiliteButton = this.buttons[this.CurButton]
end

function gDefault_Input_GeneralLeft(this)
	this.CurButton = FollowButtonLink(this.buttons,this.CurButton,"link_left")
	gCurHiliteButton = this.buttons[this.CurButton]
end

function gDefault_Input_GeneralUp2(this)
	-- If base class handled this work, then we're done
	if(gShellScreen_fnDefaultInputUp(this)) then
		return
	end

	this.CurButton = FollowButtonLink(this.buttons,this.CurButton,"link_up")
	gCurHiliteButton2 = this.buttons[this.CurButton]
end

function gDefault_Input_GeneralDown2(this)
	-- If base class handled this work, then we're done
	if(gShellScreen_fnDefaultInputDown(this)) then
		return
	end

	this.CurButton = FollowButtonLink(this.buttons,this.CurButton,"link_down")
	gCurHiliteButton2 = this.buttons[this.CurButton]
end

function gDefault_Input_GeneralRight2(this)
	this.CurButton = FollowButtonLink(this.buttons,this.CurButton,"link_right")
	gCurHiliteButton2 = this.buttons[this.CurButton]
end

function gDefault_Input_GeneralLeft2(this)
	this.CurButton = FollowButtonLink(this.buttons,this.CurButton,"link_left")
	gCurHiliteButton2 = this.buttons[this.CurButton]
end

gIFScreenTemplate = {
	-- For button presses, follow link if applicable, activate as necessary
	Input_GeneralUp    = gDefault_Input_GeneralUp,
	Input_GeneralRight = gDefault_Input_GeneralRight,
	Input_GeneralDown  = gDefault_Input_GeneralDown,
	Input_GeneralLeft  = gDefault_Input_GeneralLeft,
}

gIFScreenTemplate2 = {
	-- For button presses, follow link if applicable, activate as necessary
	Input_GeneralUp    = gDefault_Input_GeneralUp2,
	Input_GeneralRight = gDefault_Input_GeneralRight2,
	Input_GeneralDown  = gDefault_Input_GeneralDown2,
	Input_GeneralLeft  = gDefault_Input_GeneralLeft2,
}

function NewIFScreen(Template)
	local temp = createObj(gIFScreenTemplate, Template)
	temp.type = temp.type or "screen"
	return temp
end

-- Makes a second ifscreen for the bottom
function NewIFShellScreen2(Template)
	local temp = createObj(gIFShellScreenTemplate2, Template)
	temp.type = "screen"

	NewIFShellScreen_common(temp,Template)

	return createObj(gIFScreenTemplate2, temp)
end



gScrnW,gScrnH = ScriptCB_GetScreenInfo()
gSafeW,gSafeH = ScriptCB_GetSafeScreenInfo()

