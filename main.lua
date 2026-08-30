MUSTELIDMOD = RegisterMod("Mustela", 1)
local mod = MUSTELIDMOD
local json = require("json")
local saveData = {}
function MUSTELIDMOD.LoadSaveData()
    if not saveData then -- If we have no save data loaded
        if MUSTELIDMOD:HasData() then
            saveData = json.decode(MUSTELIDMOD:LoadData())
        else
            saveData = {}
        end
    end
    return saveData
end
-- To keep things organized, let's put all DSS-related data in its own table.
function MUSTELIDMOD.GetDssData()
    local data = MUSTELIDMOD.LoadSaveData()
    if not data.DssMenu then
        data.DssMenu = {}
    end
    return data.DssMenu
end
function MUSTELIDMOD.StoreSaveData()
    MUSTELIDMOD:SaveData(json.encode(saveData))
end
-- This variable and all functions contained within it are required for DSS to run.
local menuProvider = {}
function menuProvider.SaveSaveData()
    MUSTELIDMOD.StoreSaveData()
end
function menuProvider.GetPaletteSetting()
    return MUSTELIDMOD.GetDssData().MenuPalette
end
function menuProvider.SavePaletteSetting(var)
    MUSTELIDMOD.GetDssData().MenuPalette = var
end
function menuProvider.GetHudOffsetSetting()
    if not REPENTANCE then
        return MUSTELIDMOD.GetDssData().HudOffset
    else
        return Options.HUDOffset * 10
    end
end
function menuProvider.SaveHudOffsetSetting(var)
    if not REPENTANCE then
        mod.GetDssData().HudOffset = var
    end
end
function menuProvider.GetGamepadToggleSetting()
    return mod.GetDssData().GamepadToggle
end
function menuProvider.SaveGamepadToggleSetting(var)
    mod.GetDssData().GamepadToggle = var
end
function menuProvider.GetMenuKeybindSetting()
    return mod.GetDssData().MenuKeybind
end
function menuProvider.SaveMenuKeybindSetting(var)
    mod.GetDssData().MenuKeybind = var
end
function menuProvider.GetMenuHintSetting()
    return mod.GetDssData().MenuHint
end
function menuProvider.SaveMenuHintSetting(var)
    mod.GetDssData().MenuHint = var
end
function menuProvider.GetMenuBuzzerSetting()
    return mod.GetDssData().MenuBuzzer
end
function menuProvider.SaveMenuBuzzerSetting(var)
    mod.GetDssData().MenuBuzzer = var
end
function menuProvider.GetMenusNotified()
    return mod.GetDssData().MenusNotified
end
function menuProvider.SaveMenusNotified(var)
    mod.GetDssData().MenusNotified = var
end
function menuProvider.GetMenusPoppedUp()
    return mod.GetDssData().MenusPoppedUp
end
function menuProvider.SaveMenusPoppedUp(var)
    mod.GetDssData().MenusPoppedUp = var
end
local DSSInitializerFunction = include("dssmenucore")
local dssModName = "Dead Sea Scrolls (Mustela)"
local dssCoreVersion = 7
local dssMod = DSSInitializerFunction(dssModName, dssCoreVersion, menuProvider)
local directory = {}
-- Index the directory with the name of the page you're creating
-- The name of your pages are arbitrary, but make them something obvious
directory.main = {
    -- All strings must be in lowercase
    -- The title is what the user will see at the top of the page
    title = "mustela",
    -- buttons defines every button in our menu
    -- Make sure you define them in order of how you want them to appear
    buttons = {
        {
            str = "settings",
            -- Later we're going to create a page named "settings"
            dest = "settings"
        },

        -- There are a few default buttons provided in the dssMod table
        -- These buttons will handle generic menu features, like changelogs
        -- They'll only be visible in your menu if it is the only one active
        -- Otherwise, they'll appear in the outermost DSS menu
        -- This one leads to the changelogs menu, which contains changelogs defined by all mods
        dssMod.changelogsButton,
    },

    -- A tooltip can be set on either an item or a button
    -- It will display in the corner of the menu if the button with it is selected
    -- For items, it'll display only if there are no buttons with a tooltip
    -- This default tooltip tells the user how to navigate the menu
    tooltip = dssMod.menuOpenToolTip
}
directory.settings = {
    title = "settings",
    buttons = {
        {
            str = "easter eggs",
            -- choices is a list of strings that are the different choices for your button
            choices = {"on", "off"},
            -- setting is the index of the choice the player has selected
            -- We set it to 1 so that the default option is "on"
            -- This tag will update depending on what choice the player has selected
            setting = 1,
            -- variable is what DSS uses to store the state of the button
            -- Set it to any arbitrary string, just make sure that it is unique
            variable = "mustelaEasterEggs",
            -- When the menu is opened, "load" will be called on all settings-buttons
            -- This function should return what the button's current setting should be
            -- This generall means loading whatever data you have stored for the setting
            load = function ()
                -- If we have no data, it'll return 1 because of the "or"
                return mod.GetDssData().SwitchState or 1
            end,
            -- When the menu is closed, "store" will be called on all settings-buttons
            -- This function should save the button's current setting
            -- The button's current setting is passed as the first argument
            store = function (var)
                mod.GetDssData().SwitchState = var
            end,
            tooltip = {strset = {"enable or","disable this","mod's 'secret'","features"}}
        },
        -- These are the settings found on the outermost menu of DSS
        -- They'll only be visible in your menu if it is the only one active
        -- Otherwise, they'll appear in the outermost DSS menu
        dssMod.gamepadToggleButton,
        dssMod.menuKeybindButton,
        dssMod.paletteButton,
        dssMod.menuHintButton,
        dssMod.menuBuzzerButton,
    }
}
local directoryKey = {
    -- This is the initial page of your menu
    Item = directory.main,
    -- This is the index for the page that'll be displayed when opening your menu
    Main = 'main',
    -- These are default state variables for the menu
    -- They're important to have here, but you don't need to change them at all
    Idle = false,
    MaskAlpha = 1,
    Settings = {},
    SettingsChanged = false,
    Path = {},
}
DeadSeaScrollsMenu.AddMenu("Mustela", {
    -- The Run, Close, and Open functions define the core loop of your menu
    -- Once your menu is opened, all the work is shifted off to your mod running these function
    -- This allows each mod to have its own independently functioning menu.
    -- The DSSInitializerFunction returns a table with defaults defined for each function
    -- These default functions are good enough for most mods
    -- If you do want a completely custom menu, making own functions is the way to do it
    -- This function runs every render frame while your menu is open
    -- It handles everything
    Run = dssMod.runMenu,
    -- This function runs when the menu is opened
    -- Generally it initializes the menu
    Open = dssMod.openMenu,
    -- This function runs when the menu is closed
    -- Generally it handles the storing of save data and general shutdown logic.
    Close = dssMod.closeMenu,
    -- This will hide your mod behind an "other mods" button if enabled
    -- It only activates if other mods with DSS are enabled
    -- It's a good idea to enable this if you don't expect players to use your menu often
    UseSubMenu = false,
    Directory = directory,
    DirectoryKey = directoryKey
})
include("changelog")
DeadSeaScrollsMenu.AddPalettes({
    {
        -- the name of your palette
        Name = "mustelid chic",
        -- What color is the paper?
        {193, 174, 123},
        -- What color is normal text?
        {126, 79, 6},
        -- What color is highlighted text?
        {68, 45, 11}
    },
    {
        Name = "mustela's favorites",
        {193, 174, 123},
        {85, 125, 64},
        {68, 45, 11}
    },
    {
        Name = "sablez's favorites",
        {246, 142, 86},
        {111, 85, 44},
        {150, 85, 85}
    },
    {
        Name = "wintasm's favorites",
        {220, 238, 255},
        {32, 128, 200},
        {16, 32, 48}
    }
})

-- Only run MUSTELIDMOD when REPENTOGON is installed.
if not REPENTOGON then
	MUSTELIDMOD.AddCallback(ModCallbacks.MC_POST_RENDER, function(_) Isaac.RenderText("Playable Ferrets require REPENTOGON to function!!!", 60, 50, 1, 0, 0, 255) end) -- Draw on the screen that REPENTOGON isn't installed
else
	-- IDs for globals
	MUSTELIDMOD_CHARACTERS = {
		ICE = Isaac.GetPlayerTypeByName("Mustela", false),               -- Mustela
		SOCKET = Isaac.GetPlayerTypeByName("Mustela", true),        -- Tainted Mustela
		FIRE = Isaac.GetPlayerTypeByName("Sablez", false),               -- Sablez
		VOID = Isaac.GetPlayerTypeByName("Sablez", true),               -- Tainted Sablez
		HALO = Isaac.GetPlayerTypeByName("Wintasm", false)             -- Wintasm
		-- HOLY = Isaac.GetPlayerTypeByName("Wintasm", true)        -- Tainted Wintasm
}
	MUSTELIDMOD_COSTUMES = {
		ICE = Isaac.GetCostumeIdByPath("gfx/characters/ferret_facial.anm2"),
		SOCKET = Isaac.GetCostumeIdByPath("gfx/characters/gfx_socket.anm2"),
		FIRE = Isaac.GetCostumeIdByPath("gfx/characters/ferret_fire.anm2"),
		SPECS = Isaac.GetCostumeIdByPath("gfx/characters/sableglasses.anm2"),
		VOID = Isaac.GetCostumeIdByPath("gfx/characters/void_ears.anm2"),
		VSPECS = Isaac.GetCostumeIdByPath("gfx/characters/voidglasses.anm2"),
		VOID_BODY = Isaac.GetCostumeIdByPath("gfx/characters/void_body.anm2"),
		FLIGHT_ICE = Isaac.GetCostumeIdByPath("gfx/characters/MustelaFlight.anm2"),
		FLIGHT_SOCKET = Isaac.GetCostumeIdByPath("gfx/characters/taintedFlight.anm2"),
		FLIGHT_FIRE = Isaac.GetCostumeIdByPath("gfx/characters/fire_flight.anm2"),
		FLIGHT_VOID = Isaac.GetCostumeIdByPath("gfx/characters/void_flight.anm2"),
		HALO = Isaac.GetCostumeIdByPath("gfx/characters/halo.anm2"),
		FLIGHT_HALO = Isaac.GetCostumeIdByPath("gfx/characters/halo_flight.anm2")
	}
	MUSTELIDMOD_COLLECTIBLES = {
		-- Pocket Actives
		SATAN_REWARD = Isaac.GetItemIdByName("Satan's Reward"),
        BETRAYED_HEART = Isaac.GetItemIdByName("Mustela's Broken Heart"),
		VOIDED_STORAGE_EMPTY = Isaac.GetItemIdByName("Voided Storage"),
        VOIDED_STORAGE_FULL = Isaac.GetItemIdByName("Voided Storage (full)"),
		CESAREAN_SCALPEL = Isaac.GetItemIdByName("Cesarean Scalpel"),
        HALO = Isaac.GetItemIdByName("Hibernation"),

        -- Normal Actives
		EXTINCTION_CERTIFICATE = Isaac.GetItemIdByName("Extinction Certificate"),
        HOLE = Isaac.GetItemIdByName("Frantic Wormhole"),

		-- Lore Passives
		SOCKETS = Isaac.GetItemIdByName("Mustela's Tainted Sockets"),
		FLUOXETINE = Isaac.GetItemIdByName("Mustela's Medicine"),
		RODENT = Isaac.GetItemIdByName("A Carnivore's Meal"),
		MEMORIAL = Isaac.GetItemIdByName("Mischievous Corpse"),

        -- "Other" Passives
		COMEDY = Isaac.GetItemIdByName("Mask of Comedy"),
		TRAGEDY = Isaac.GetItemIdByName("Mask of Tragedy"),
		OGER = Isaac.GetItemIdByName("Oger Mask"),
	}
	MUSTELIDMOD_TRINKETS = {
        PAW = Isaac.GetTrinketIdByName("Cat Paw Replica")
    }
    MUSTELIDMOD_ACHEESEMENTS = {
        UNLOCK_TAINTED_MUSTELA = Isaac.GetAchievementIdByName("TheExtant"),
        UNLOCK_TAINTED_SABLEZ = Isaac.GetAchievementIdByName("TheVoidDweller"),
        UNLOCK_POCKET_ICE = Isaac.GetAchievementIdByName("IcePocket"),
        UNLOCK_POCKET_SOCKET = Isaac.GetAchievementIdByName("SocketPocket"),
        UNLOCK_POCKET_VOID = Isaac.GetAchievementIdByName("VoidPocket"),
        UNLOCK_POCKET_HALO = Isaac.GetAchievementIdByName("HaloPocket"),
        UNLOCK_FLUOXETINE = Isaac.GetAchievementIdByName("Fluoxetine"),
        UNLOCK_SOCKETS = Isaac.GetAchievementIdByName("Sockets"),
        UNLOCK_CORPSE = Isaac.GetAchievementIdByName("Corpse"),
    }
	-- Ferret Fetus tears for C-Section
	MUSTELIDMOD_FERRET_FETUS_TEAR = Isaac.GetEntityVariantByName("Ferret Fetus Tear")
    -- All special tearflag-type stuff, including Mustela and T.Sablez's Birthright tear effects, and Wintasm's chance-based tear flags
	include("code/special_ferret_tears")
	-- EID / POGCHAMP / THE FUTURE compatibility
	include("code/mod_compatibility")
    -- Items
	include("code/items")
	include("code/trinkets")
	include("code/sablez_moving_box") -- I'm not even gonna fucking TRY to merge this fucker!!! Evil script! EVIL SCRIPT!!!!!
	-- Character data
	include("code/characters")
	-- Kill Scripts aka "icy boy hates fire and lesbian hates Sausage"
	include("code/ice_dislikes")
	include("code/fire_dislikes")
	include("code/socket_dislikes")
	include("code/void_dislikes")
    -- Unlock Handler
    include("code/unlocks")
end