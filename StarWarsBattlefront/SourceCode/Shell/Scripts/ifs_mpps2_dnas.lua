
-----------------------------------------------------------------------
-- first set of popup callbacks (busy popup)
-----------------------------------------------------------------------

-- Returns -1, 0, or 1, depending on error, busy, or success
function ifs_mpps2_dnas_busypopup_fnCheckDone()
	return ScriptCB_IsDNASDone()
end

function ifs_mpps2_dnas_okpopup_ok()
	print("ifs_mpps2_dnas_okpopup_ok")
	-- done, goto gamespy login
    ScriptCB_DoneCheckDNAS()
    ifs_movietrans_PushScreen(ifs_mpps2_patch)
end
function ifs_mpps2_dnas_busypopup_fnOnSuccess()
	print("ifs_mpps2_dnas_busypopup_fnOnSuccess")
	local this = ifs_mpps2_dnas
	Popup_Busy:fnActivate(nil)
	
	-- reactivate the network cable message
	ScriptCB_SetNoticeNoCable(1)
	
	-- hide the dnas image
	IFObj_fnSetVis(this.dnasImg,nil)
	IFObj_fnSetVis(this.dnasTM,nil)
	
	-- display a successful dialog box
	Popup_Ok.fnDone = ifs_mpps2_dnas_okpopup_ok
	IFText_fnSetString(Popup_Ok.title,"ifs.mp.dnas.authsuccess")
	Popup_Ok:fnActivate(1)		
end

function ifs_mpps2_dnas_busypopup_fnOnFail()
	print("ifs_mpps2_dnas_busypopup_fnOnFail")
	local this = ifs_mpps2_dnas
	Popup_Busy:fnActivate(nil)
	
	-- reactivate the network cable message
	--ScriptCB_SetNoticeNoCable(nil)
	--don't do this here, but when we press ok
	
	-- we failed, so get the dnas error message, and show it on the screen.
	-- don't use the ok popup since the text is too long to fit
	local errStr = ScriptCB_GetDNASError()
	IFText_fnSetUString( this.errorText, errStr )
	-- show them
	IFObj_fnSetVis(this.errorText,1)
	IFObj_fnSetVis(this.buttons,1)
	this.errorVisible = 1
	-- hide the dnas image
	IFObj_fnSetVis(this.dnasImg,nil)
	IFObj_fnSetVis(this.dnasTM,nil)
end

function ifs_mpps2_dnas_busypopup_fnOnCancel()
	print("ifs_mpps2_dnas_busypopup_fnOnCancel")
	local this = ifs_mpps2_dnas
	Popup_Busy:fnActivate(nil)
	
	-- reactivate the network cable message
	ScriptCB_SetNoticeNoCable(1)
	
	ScriptCB_PopScreen()
end

-----------------------------------------------------------------------
-- main screen
-----------------------------------------------------------------------

ifs_mpps2_dnas = NewIFShellScreen {
 	nologo = 1,
 	bNohelptext = 1,
    movieIntro      = nil,
    movieBackground = nil,
 	
	buttons = NewIFContainer {
		ScreenRelativeX = 0.5,
		ScreenRelativeY = 0.8,
	},

	dnasImg = NewIFImage { 
		ScreenRelativeX = 0,
		ScreenRelativeY = 0,
		texture = "dnas_logo", 
		localpos_l = 0,
		localpos_t = 0,
		localpos_r = 100,
		localpos_b = 100,
		uvs_b = 1,
	},
	dnasTM = NewIFText {
		font = "gamefont_tiny",
		textw = 500,
		texth = 100,
		ScreenRelativeX = 0.5,
		ScreenRelativeY = 1.0,
		y = -50,
		flashy=0,
		string = "ifs.mp.dnas.trademark",
	},
	
	errorText = NewIFText {
		font = "gamefont_medium",
		textw = 400,
		texth = 400,
		y = -80,
		ScreenRelativeX = 0.5,
		ScreenRelativeY = 0.5,
		flashy=0,
	},
 	

	Enter = function(this,bFwd)
		print("ifs_mpps2_dnas.Enter(",bFwd,")")

		-- Backing into this screen? Don't stay here.
		if(not bFwd) then
			-- we're coming from the eula, stay here
			if(this.ReturningFromEULA) then
				this.ReturningFromEULA = nil				
			else
				print("ifs_mpps2_dnas not forward, popping")
				ScriptCB_PopScreen()
				return
			end
        end
        
        gIFShellScreenTemplate_fnEnter(this, bFwd)
		
		-- need to do the EULA?
		if(not ScriptCB_HasSeenDNASEULA()) then
			ifs_movietrans_PushScreen(ifs_mpps2_eula)
		    return
		end
		
		-- do we need to be here?
		if(not ScriptCB_ShouldCheckDNAS()) then
			print("ifs_mpps2_dnas not ScriptCB_ShouldCheckDNAS, pushing")
		    ifs_movietrans_PushScreen(ifs_mpps2_patch)
		    return
		end
		
		-- hide the error text until we get an error
		this.errorVisible = nil
		IFObj_fnSetVis(this.errorText,nil)
		IFObj_fnSetVis(this.buttons,nil)

		-- show the dnas image
		IFObj_fnSetVis(this.dnasImg,1)
		IFObj_fnSetVis(this.dnasTM,1)
		
		-- hide the skip button in final builds?
		if(not ScriptCB_AllowSkipDNAS()) then
			print("ifs_mpps2_dnas AllowSkipDNAS")
			this.buttons.skip.hidden = 1
			this.CurButton = ShowHideVerticalButtons(this.buttons,ifs_mpps2_dnas_button_layout)
		end
		SetCurButton(this.CurButton)
		
		
		-- ignore the missing network cable message during DNAS, because, to quote QA:
		-- "7/15/2004, PS2Beta.v8.1.(7/15) When you take the network cable out while the
		-- DNAS is authenticating, the message “The network cable is not connected...” shows
		-- up.  However, at that point, the message “Network Error (-612) There was no
		-- response from the DNS server.  Please check your network configuration.” should
		-- pop up instead."
		ScriptCB_SetNoticeNoCable(nil)
		-- coming forward, start the dnas stuff
		ScriptCB_StartDNAS()
		
		-- And show the popup.
		Popup_Busy.fnCheckDone =	ifs_mpps2_dnas_busypopup_fnCheckDone
		Popup_Busy.fnOnSuccess =	ifs_mpps2_dnas_busypopup_fnOnSuccess
		Popup_Busy.fnOnFail =		ifs_mpps2_dnas_busypopup_fnOnFail
		Popup_Busy.fnOnCancel =		ifs_mpps2_dnas_busypopup_fnOnCancel
		Popup_Busy.bNoCancel = 1 -- no cancel button
		Popup_Busy.fTimeout = 600 -- seconds
		IFText_fnSetString(Popup_Busy.title,"common.mp.authenticating")
		Popup_Busy:fnActivate(1)
	end,
	
	Input_Accept = function(this)
		-- if we're on the error mode, then quit when we get a button press
		if(this.errorVisible) then
			-- reactivate the network cable message
			ScriptCB_SetNoticeNoCable(1)
	
            ifelm_shellscreen_fnPlaySound(this.acceptSound)
			if(this.CurButton == "ok") then
				ScriptCB_PopScreen()
			elseif (this.CurButton == "skip") then
				
				-- double check this
				if(ScriptCB_AllowSkipDNAS()) then
					ScriptCB_DoneCheckDNAS()
		            ifs_movietrans_PushScreen(ifs_mpps2_patch)
				end
			end
		end
	end,

}

ifs_mpps2_dnas_button_layout = {
	yTop = 15,
	yHeight = 25,
	ySpacing  = 5,
	width = 200,
	font = "gamefont_medium",
	buttonlist = { 
		{ tag = "skip", string = "debug: skip it", },
		{ tag = "ok", string = "common.ok", },
	},
	nocreatebackground = 1,
}
ifs_mpps2_dnas.CurButton = AddVerticalButtons(ifs_mpps2_dnas.buttons,ifs_mpps2_dnas_button_layout)
AddIFScreen(ifs_mpps2_dnas,"ifs_mpps2_dnas")
