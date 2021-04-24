
-- Screens to show, with time per screen
gLegalScreenList = {
    { texture = "bootESRB", time = 0, },
   -- { texture = "bootlegal", time = 0, },
   -- { texture = "lucasarts_logo", time = 0, bSkippable = 1, },
   -- { texture = "pandemic_logo", time = 0, bSkippable = 1, },
 --   { texture = "nvidia_logo", time = 0, bSkippable = 1, },

    -- play the movie unless you hit x to skip, the show the texture.  else skip the texture.
--  { movie = "pandemic_logo", texture = "pandemic_logo", time = 3, bSkippable = 1, },

--  { texture = "logodolby", time = 0, bSkippable = 1, },
 --   { texture = "dolby_logo", time = 0, bSkippable = 1, },
}

function ifs_legal_GotoNext(this,bWasSkip)
    
    -- reset this
    this.SkippedMovie = nil 
    
    -- Advance to next screen
    this.OnPage = this.OnPage + 1
    if(this.OnPage > getn(gLegalScreenList)) then
        ScriptCB_SetIFScreen("ifs_start")
    else
        -- what was the previous screen?
        local prev = "none"
        if(this.OnPage > 1) then
            if(gLegalScreenList[this.OnPage - 1].movie) then
                prev = "movie"
            else
                prev = "texture"
            end
        end
        
        -- what is the next screen
        local next = "none"
        if(gLegalScreenList[this.OnPage].movie) then
            next = "movie"  
        else
            next = "texture"
        end
        
        -- set the texture that will fade out (this.ShowTexture)
        if(prev == "texure") then
            IFImage_fnSetTexture(this.ShowTexture, gLegalScreenList[this.OnPage - 1].texture)
            AnimationMgr_AddAnimation(this.ShowTexture , { fTotalTime = 0.25, fStartAlpha = 1, fEndAlpha = 0,})
        elseif(prev == "movie") then
            ifelem_shellscreen_fnStopMovie()
        end
        
        -- set the texture that will fade in (this.ShowTexture2)
        if(next == "texture") then
            IFImage_fnSetTexture(this.ShowTexture2, gLegalScreenList[this.OnPage].texture)
            AnimationMgr_AddAnimation(this.ShowTexture2, { fTotalTime = 0.4, fStartAlpha = 0, fEndAlpha = 1,})
            if(this.bEverSkipped) then
                this.Timer = 0.4 -- fast-forward thru rest of screens
            else
                this.Timer = gLegalScreenList[this.OnPage].time
            end
        elseif(next == "movie") then
            AnimationMgr_AddAnimation(this.ShowTexture2 , { fTotalTime = 0.1, fStartAlpha = 0, fEndAlpha = 0,})
            ifelem_shellscreen_fnStartMovie(gLegalScreenList[this.OnPage].movie, 0, nil, 1)
        end
    end
end

--  Input_Start = function(this)
--      if((this.OnPage > 0) and (this.OnPage < getn(gLegalScreenList))) then
--          if(gLegalScreenList[this.OnPage].bSkippable) then
--              this.Timer = 0
--              this.OnPage = getn(gLegalScreenList)
--          end -- current page is skippable
--      end -- page is sane
--  end,

function ifs_legal_fnTryToSkip(this)
    if(this.OnPage>0 and gLegalScreenList[this.OnPage].bSkippable) then
        this.bEverSkipped = 1

        if(gLegalScreenList[this.OnPage].movie) then
            if(not this.SkippedMovie) then
                this.SkippedMovie = 1

                -- switch to the backup texture for this screen
                ifelem_shellscreen_fnStopMovie()
                IFImage_fnSetTexture(this.ShowTexture2, gLegalScreenList[this.OnPage].texture)
                AnimationMgr_AddAnimation(this.ShowTexture2, { fTotalTime = 0.4, fStartAlpha = 0, fEndAlpha = 1,})
                this.Timer = 0.6
            end
        else -- current screen is a texture
            this.Timer = 0 -- skip out of current screen, fast-forward thru next.
        end
    end -- could skip
end

ifs_legal = NewIFShellScreen {
    -- # of seconds before we go into demomode. XBox TCR C1-6 says
    -- this must be no larger than 120 seconds
    Timer = 0, -- how long the current page has before it's advanced
    OnPage = 0, -- start before first page
    nologo = 1,
    bNohelptext = 1,
    bNohelptext_backPC = 1,
    movieIntro      = nil,
    movieBackground = nil,
    enterSound      = "",
    exitSound       = "",

    ShowTexture = NewIFImage { 
        ScreenRelativeX = 0.5,
        ScreenRelativeY = 0.5,
        UseSafezone = 0,

        texture = "opaque_black", 
        -- Size, UVs aren't fully specified here, but in NewIFShellScreen()
    },

    ShowTexture2 = NewIFImage { 
        ScreenRelativeX = 0.5,
        ScreenRelativeY = 0.5,
        UseSafezone = 0,

        ZPos = 120, -- a bit in front of the other texture

        texture = "opaque_black", 
        -- Size, UVs aren't fully specified here, but in NewIFShellScreen()
    },

    Enter = function(this, bFwd)
        gIFShellScreenTemplate_fnEnter(this, bFwd)

        -- If player has already logged in, and the shell is just legaling
        -- up, jump forward to main menu
        if(bFwd and ((not ScriptCB_ShouldShowLegal()) or ScriptCB_SkipToNTGUI()) ) then
            this.bNoUnbind = 1
            ScriptCB_SetIFScreen("ifs_start")
        else
            -- Ignore controllers that go missing during this screen
            ScriptCB_SetIgnoreControllerRemoval(1)
        end

        -- Got rid of ESRB logo now that it's on bootlegal - NM 8/26/04
        if(this.OnPage == 0) then
            this.OnPage = 1 -- skip ESRB/PEGI logo.
        end


        -- allow all controllers
        ScriptCB_SetAutoAcquireControllers(1)
        ScriptCB_ReadAllControllers(1)

        if(not ScriptCB_IsErrorBoxOpen()) then
            ScriptCB_EnableCursor(0)
        end
    end,
    
    Exit = function(this, bFwd)
        print("ifs_legal.Exit")

        ScriptCB_EnableCursor(1)
        
        -- make sure we got this
        ifelem_shellscreen_fnStopMovie()
        
        -- detatch all controllers
        ScriptCB_SetAutoAcquireControllers(nil)
        ScriptCB_ReadAllControllers(nil)
        if(not this.bNoUnbind) then
            ScriptCB_UnbindController(1)
            ScriptCB_UnbindController(2)
            ScriptCB_UnbindController(3)
            ScriptCB_UnbindController(4)
        end     
    end,

    Update = function(this, fDt)
        -- Call base class functionality
        gIFShellScreenTemplate_fnUpdate(this, fDt)
        
        if(this.OnPage and this.OnPage<=getn(gLegalScreenList)) then
            -- are we showing a texture or a movie?
            if(this.OnPage~=0 and gLegalScreenList[this.OnPage].movie and not this.SkippedMovie) then
                -- movie
                if(not ScriptCB_IsMoviePlaying()) then
                    ifs_legal_GotoNext(this)
                end
            else
                -- texture
                this.Timer = this.Timer - fDt
                if(this.Timer < 0) then         
                    ifs_legal_GotoNext(this)
                end
            end
        end
    end,

    -- Start actually works on this screen
    Input_Start = function(this)
        ifs_legal_fnTryToSkip(this)
    end,

    Input_Accept = function(this)
        ifs_legal_fnTryToSkip(this)
    end,

    -- Overrides for most input handlers, as we want to do nothing
    -- when this happens on this screen.
    Input_Back = function(this)
    end,
    Input_GeneralLeft = function(this)
    end,
    Input_GeneralRight = function(this)
    end,
    Input_GeneralUp = function(this)
    end,
    Input_GeneralDown = function(this)
    end,
}

function ifs_legal_fnBuildScreen(this)
    -- Ask game for screen size, fill in values
    local w, h, v, widescreen
    w,h,v,widescreen=ScriptCB_GetScreenInfo()
    this.ShowTexture.localpos_l =-w*0.5
    this.ShowTexture.localpos_t =-h*0.5
    this.ShowTexture.localpos_r = w*0.5 
    this.ShowTexture.localpos_b = h*0.5
    this.ShowTexture.uvs_b = v
    this.ShowTexture2.localpos_l =-w*0.5
    this.ShowTexture2.localpos_t =-h*0.5
    this.ShowTexture2.localpos_r = w*0.5 
    this.ShowTexture2.localpos_b = h*0.5
    this.ShowTexture2.uvs_b = v
end

ifs_legal_fnBuildScreen(ifs_legal) -- programatic chunks
ifs_legal_fnBuildScreen = nil
AddIFScreen(ifs_legal,"ifs_legal")
