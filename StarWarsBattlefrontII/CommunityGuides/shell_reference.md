
Taken from: http://gametoast.com/viewtopic.php?f=27&t=32145

Finally figured out some more details about how IF screens work. Some of you might have known, but its not explained anywhere yet. 

All interface screens are stored on a stack, imagine a deck of cards. The screen you are seeing is always the top of the stack.

ScriptCB_PushScreen(screenName)
pushes to screen, once current execution finishes.
It is not like a return statement, if you call another function after calling this, it will finish the next function, then push the screen. 
When you Push a screen, the screen.Exit() fucntion of you current screen is called, and then the screen.Enter() of the new screen is called.. PushScreen sets bFwd to 1 in the Exit and Enter functions.

ScriptCB_PopScreen()

Pops the current screen to the previous in the stack. bFwd is nil for the Exit function of the current screen and the Enter function of the previous screen.

ScriptCB_PopScreen(screenName)

this one is rarely used, but it works differently. It pops every card from the top of the stack until it arrives to screenName. bFwd is nil again

ScriptCB_SetIFScreen(screenName)

this one only changes the top of the stack. It Pops/Exits the current screen, and the Pushes/Enters to screenName. bFwd is 1.

ScriptCB_IsScreenInStack(screenName)
pretty simple, returns true/false if the screen is in the stack

in the code, interface screens typically are name starting with ifs_.... The main menu is an interface screen,  mission select is one. they are created with the function NewIFScreen and are added to the game with the function AddIFScreen. 

the ifs_freeform scripts are galactic conquest and ifs_campaign are the campaign. Its when you look at the galactic map

Its important to use the screen system as intended. If you only push to screens over and over, it might run out of screen memory. I believe it is around 40 screen, but not sure.

A common way of editing game screens is overriding the ScriptCB_DoFile function to redirect it to load your screen. Put this at the top of your mission script. for example:

```lua
originalDoFile = ScriptCB_DoFile

ScriptCB_DoFile = function(filename)

    print("debug: DoFile loaded " .. tostring(filename))

    if(filename == "ifs_pausemenu") then
        originalDoFile("ifs_pausemenu_custom")
    else
        originalDoFile(filename)
    end
end
```

If you want to override only part of the screen, not the whole thing, you can override AddIFScreen. You would put this after ingame.lvl is loaded in your mission script, since thats when AddIFScreen is defined.

```lua
if AddIFScreen then

    originalAddIFScreen = AddIFScreen

    AddIFScreen = function (screen, screenName)

        print("debug: AddIFScreen args " .. tostring(screen) .. " " .. tostring(screenName))

        if screenName == "ifs_pausemenu" then

            -- add new button without remaking the whole pause menu
            local newButton = { tag = "invincible", string = "cheats.invincible_on", }
            table.insert(ifspausemenu_vbutton_layout.buttonlist, newButton)
            ifs_pausemenu.CurButton = AddVerticalButtons(ifs_pausemenu.buttons,ifspausemenu_vbutton_layout)

            originalAddIFScreen(screen, screenName)
        end

        originalAddIFScreen(screen, screenName)
    end
else

    print("debug: function AddIFScreen not defined yet yet")

end
```

Now if you add a new button to the pause menu and want to make it do anything, you have to edit the ifs_pausemenu.Input_Accept function. Input_Accept is one of the functions that any IFScreen can have, like Enter and Exit. it gets called when you click while on the screen. the "tag" of the button sets "CurButton". so just add an if statement to check if the CurButton is your button, and then do whatever you want, like push to another screen.

As far as I know, you can't add any new buttons to a screen after it has been added (after AddIFScreen is called). You can only toggle their visibility.

If you want to edit screen from the main menu, campaign, or galactic conquest, you have to put the code in a custom_gc lvl which the v1.3 patch allows. this is because it would load that before anything else in the load order.

read more about Lua environments here: https://github.com/BAD-AL/SWBF2_Xbox_mod_effort/wiki/SWBFII-Lua-Environments
