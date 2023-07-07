--- @class gb.FlagValue
--- @field value number
--- @field description string

--- @alias gb.FlagSet table<string, gb.FlagValue>

--- @class gb.BitFlags
--- @field MaterialFlags gb.FlagSet
--- @field MaterialFlags2 gb.FlagSet
--- @field Damage gb.FlagSet
--- @field Convar gb.FlagSet
--- @field Entity gb.FlagSet
--- @field Texture gb.FlagSet
gb.Bitflags = {

    --- Material "$flags" bitflags
    MaterialFlags = {
        MATERIAL_VAR_DEBUG = {
            value = 1, description = "Debug material"
        },
        MATERIAL_VAR_NO_DEBUG_OVERRIDE = {
            value = 2, description = "No debug override"
        },
        MATERIAL_VAR_NO_DRAW = {
            value = 4, description = "No draw"
        },
        MATERIAL_VAR_USE_IN_FILLRATE_MODE = {
            value = 8, description = "Use in fill rate mode"
        },
        MATERIAL_VAR_VERTEXCOLOR = {
            value = 16, description = "Vertex color"
        },
        MATERIAL_VAR_VERTEXALPHA = {
            value = 32, description = "Vertex alpha"
        },
        MATERIAL_VAR_SELFILLUM = {
            value = 64, description = "Self-illumination"
        },
        MATERIAL_VAR_ADDITIVE = {
            value = 128, description = "Additive blending"
        },
        MATERIAL_VAR_ALPHATEST = {
            value = 256, description = "Alpha testing"
        },
        MATERIAL_VAR_MULTIPASS = {
            value = 512, description = "Multipass"
        },
        MATERIAL_VAR_ZNEARER = {
            value = 1024, description = "Closer Z distance"
        },
        MATERIAL_VAR_MODEL = {
            value = 2048, description = "Model material"
        },
        MATERIAL_VAR_FLAT = {
            value = 4096, description = "Flat shading"
        },
        MATERIAL_VAR_NOCULL = {
            value = 8192, description = "No backface culling"
        },
        MATERIAL_VAR_NOFOG = {
            value = 16384, description = "No fog"
        },
        MATERIAL_VAR_IGNOREZ = {
            value = 32768, description = "Ignore Z-buffer"
        },
        MATERIAL_VAR_DECAL = {
            value = 65536, description = "Decal material"
        },
        MATERIAL_VAR_ENVMAPSPHERE = {
            value = 131072, description = "Environment map sphere"
        },
        MATERIAL_VAR_NOALPHAMOD = {
            value = 262144, description = "No alpha modulation"
        },
        MATERIAL_VAR_ENVMAPCAMERASPACE = {
            value = 524288, description = "Environment map camera space"
        },
        MATERIAL_VAR_BASEALPHAENVMAPMASK = {
            value = 1048576, description = "Base alpha environment map mask"
        },
        MATERIAL_VAR_TRANSLUCENT = {
            value = 2097152, description = "Translucent material"
        },
        MATERIAL_VAR_NORMALMAPALPHAENVMAPMASK = {
            value = 4194304, description = "Normal map alpha environment map mask"
        },
        MATERIAL_VAR_NEEDS_SOFTWARE_SKINNING = {
            value = 8388608, description = "Requires software skinning"
        },
        MATERIAL_VAR_OPAQUETEXTURE = {
            value = 16777216, description = "Opaque texture"
        },
        MATERIAL_VAR_ENVMAPMODE = {
            value = 33554432, description = "Environment map mode"
        },
        MATERIAL_VAR_SUPPRESS_DECALS = {
            value = 67108864, description = "Suppress decals"
        },
        MATERIAL_VAR_HALFLAMBERT = {
            value = 134217728, description = "Half Lambert lighting"
        },
        MATERIAL_VAR_WIREFRAME = {
            value = 268435456, description = "Wireframe rendering"
        },
        MATERIAL_VAR_ALLOWALPHATOCOVERAGE = {
            value = 536870912, description = "Allow alpha to coverage"
        },
        MATERIAL_VAR_IGNORE_ALPHA_MODULATION = {
            value = 1073741824, description = "Ignore alpha modulation"
        }
    },

    --- Material "$flags2" bitflags
    MaterialFlags2 = {
        MATERIAL_VAR2_LIGHTING_UNLIT = {
            value = 0, description = "Material is unlit"
        },
        MATERIAL_VAR2_LIGHTING_VERTEX_LIT = {
            value = 2, description = "Material is vertex lit"
        },
        MATERIAL_VAR2_LIGHTING_LIGHTMAP = {
            value = 4, description = "Material uses lightmap lighting"
        },
        MATERIAL_VAR2_LIGHTING_BUMPED_LIGHTMAP = {
            value = 8, description = "Material uses bumped lightmap lighting"
        },
        MATERIAL_VAR2_LIGHTING_MASK = {
            value = 14, description = "Mask for lighting type"
        },
        MATERIAL_VAR2_DIFFUSE_BUMPMAPPED_MODEL = {
            value = 16, description = "Material is a diffuse bump-mapped model"
        },
        MATERIAL_VAR2_USES_ENV_CUBEMAP = {
            value = 32, description = "Material uses environment cubemaps"
        },
        MATERIAL_VAR2_NEEDS_TANGENT_SPACES = {
            value = 64, description = "Material needs tangent spaces"
        },
        MATERIAL_VAR2_NEEDS_SOFTWARE_LIGHTING = {
            value = 128, description = "Material requires software lighting"
        },
        MATERIAL_VAR2_BLEND_WITH_LIGHTMAP_ALPHA = {
            value = 256, description = "Material blends with lightmap alpha"
        },
        MATERIAL_VAR2_NEEDS_BAKED_LIGHTING_SNAPSHOTS = {
            value = 512, description = "Material requires baked lighting snapshots"
        },
        MATERIAL_VAR2_USE_FLASHLIGHT = {
            value = 1024, description = "Material uses flashlight"
        },
        MATERIAL_VAR2_USE_FIXED_FUNCTION_BAKED_LIGHTING = {
            value = 2048, description = "Material uses fixed function baked lighting"
        },
        MATERIAL_VAR2_NEEDS_FIXED_FUNCTION_FLASHLIGHT = {
            value = 4096, description = "Material requires fixed function flashlight"
        },
        MATERIAL_VAR2_USE_EDITOR = {
            value = 8192, description = "Material uses editor"
        },
        MATERIAL_VAR2_NEEDS_POWER_OF_TWO_FRAME_BUFFER_TEXTURE = {
            value = 16384, description = "Material requires power of two frame buffer texture"
        },
        MATERIAL_VAR2_NEEDS_FULL_FRAME_BUFFER_TEXTURE = {
            value = 32768, description = "Material requires full frame buffer texture"
        },
        MATERIAL_VAR2_IS_SPRITECARD = {
            value = 65536, description = "Material is a sprite card"
        },
        MATERIAL_VAR2_USES_VERTEXID = {
            value = 131072, description = "Material uses vertex ID"
        },
        MATERIAL_VAR2_SUPPORTS_HW_SKINNING = {
            value = 262144, description = "Material supports hardware skinning"
        },
        MATERIAL_VAR2_SUPPORTS_FLASHLIGHT = {
            value = 524288, description = "Material supports flashlight"
        }
    },

    --- CTakeDamageInfo damage type bitflags
    Damage = {
        DMG_GENERIC = {
            value = 0, description = "Generic damage (used by weapon_fists)"
        },
        DMG_CRUSH = {
            value = 1, description = "Caused by physics interaction and ignored by airboat drivers. This is used by the Rollermine and an unused animation attack called 'Fireattack' by the Antlion Guard ACT_RANGE_ATTACK1"
        },
        DMG_BULLET = {
            value = 2, description = "Bullet damage from Ceiling Turrets, the Strider, Turrets and most guns."
        },
        DMG_SLASH = {
            value = 4, description = "Used by the Stunstick, Manhacks, Antlions, Antlion Guards, Headcrabs, Fast Headcrabs, all Zombies types, Hunter, and potentially other NPCs attacks"
        },
        DMG_BURN = {
            value = 8, description = "Damage from fire"
        },
        DMG_VEHICLE = {
            value = 16, description = "Hit by a vehicle (This will need to be set for passengers of some vehicle to receive damage)"
        },
        DMG_FALL = {
            value = 32, description = "Fall damage"
        },
        DMG_BLAST = {
            value = 64, description = "Explosion damage like grenades, helicopter bombs, combine mines, Will be ignored by most vehicle passengers."
        },
        DMG_CLUB = {
            value = 128, description = "Blunt attacks such as from the Crowbar, Antlion Guard & Hunter"
        },
        DMG_SHOCK = {
            value = 256, description = "Electrical damage, shows smoke at the damage position and its used by Stalkers & Vortigaunts"
        },
        DMG_SONIC = {
            value = 512, description = "Sonic damage, used by the Gargantua and Houndeye NPCs"
        },
        DMG_ENERGYBEAM = {
            value = 1024, description = "Laser damage"
        },
        DMG_PREVENT_PHYSICS_FORCE = {
            value = 2048, description = "Prevent a physics force."
        },
        DMG_NEVERGIB = {
            value = 4096, description = "Crossbow damage, never creates gibs."
        },
        DMG_ALWAYSGIB = {
            value = 8192, description = "Always create gibs"
        },
        DMG_DROWN = {
            value = 16384, description = "Drown damage"
        },
        DMG_PARALYZE = {
            value = 32768, description = "Same as DMG_POISON"
        },
        DMG_NERVEGAS = {
            value = 65536, description = "Neurotoxin damage"
        },
        DMG_POISON = {
            value = 131072, description = "Poison damage used by Antlion Workers & Poison Headcrabs."
        },
        DMG_RADIATION = {
            value = 262144, description = "Radiation damage & it will be ignored by most vehicle passengers"
        },
        DMG_DROWNRECOVER = {
            value = 524288, description = "Damage applied to the player to restore health after drowning"
        },
        DMG_ACID = {
            value = 1048576, description = "Toxic chemical or acid burn damage used by the Antlion Workers"
        },
        DMG_SLOWBURN = {
            value = 2097152, description = "In an oven"
        },
        DMG_REMOVENORAGDOLL = {
            value = 4194304, description = "Don't create a ragdoll on death"
        },
        DMG_PHYSGUN = {
            value = 8388608, description = "Damage done by the gravity gun."
        },
        DMG_PLASMA = {
            value = 16777216, description = "Plasma damage"
        },
        DMG_AIRBOAT = {
            value = 33554432, description = "Airboat gun damage"
        },
        DMG_DISSOLVE = {
            value = 67108864, description = "Forces the entity to dissolve on death. This is what the combine ball uses when it hits a target."
        },
        DMG_BLAST_SURFACE = {
            value = 134217728, description = "This won't hurt the player underwater"
        },
        DMG_DIRECT = {
            value = 268435456, description = "Direct damage to the entity that does not go through any damage value modifications"
        },
        DMG_BUCKSHOT = {
            value = 536870912, description = "The pellets fired from a shotgun"
        },
        DMG_SNIPER = {
            value = 1073741824, description = "Damage from SniperRound/SniperPenetratedRound ammo types"
        },
        DMG_MISSILEDEFENSE = {
            value = 2147483648, description = "Damage from npc_missiledefense, npc_combinegunship, or monster_mortar"
        },
    },

    --- FL_ Entity Flags
    Entity = {
        FL_ONGROUND = {
            value = 1, description = "Is the entity on ground or not"
        },
        FL_DUCKING = {
            value = 2, description = "Is player ducking or not"
        },
        FL_ANIMDUCKING = {
            value = 4, description = "Is the player in the process of ducking or standing up"
        },
        FL_WATERJUMP = {
            value = 8, description = "The player is jumping out of water"
        },
        FL_ONTRAIN = {
            value = 16, description = "This player is controlling a func_train"
        },
        FL_INRAIN = {
            value = 32, description = "Indicates the entity is standing in rain"
        },
        FL_FROZEN = {
            value = 64, description = "Completely freezes the player"
        },
        FL_ATCONTROLS = {
            value = 128, description = "This player is controlling something UI related in the world, this prevents his movement, but doesn't freeze mouse movement, jumping, etc."
        },
        FL_CLIENT = {
            value = 256, description = "Is this entity a player or not"
        },
        FL_FAKECLIENT = {
            value = 512, description = "Bots have this flag"
        },
        FL_INWATER = {
            value = 1024, description = "Is the player in water or not"
        },
        FL_FLY = {
            value = 2048, description = "This entity can fly"
        },
        FL_SWIM = {
            value = 4096, description = "This entity can swim"
        },
        FL_CONVEYOR = {
            value = 8192, description = "This entity is a func_conveyor"
        },
        FL_NPC = {
            value = 16384, description = "NPCs have this flag (NPC: Ignore player push)"
        },
        FL_GODMODE = {
            value = 32768, description = "Whether the player has god mode enabled"
        },
        FL_NOTARGET = {
            value = 65536, description = "Makes the entity invisible to AI"
        },
        FL_AIMTARGET = {
            value = 131072, description = "This entity can be aimed at"
        },
        FL_PARTIALGROUND = {
            value = 262144, description = "Not all corners are valid"
        },
        FL_STATICPROP = {
            value = 524288, description = "It's a static prop"
        },
        FL_GRAPHED = {
            value = 1048576, description = "worldgraph has this ent listed as something that blocks a connection"
        },
        FL_GRENADE = {
            value = 2097152, description = "This entity is a grenade, unused"
        },
        FL_STEPMOVEMENT = {
            value = 4194304, description = "Changes the SV_Movestep() behavior to not do any processing"
        },
        FL_DONTTOUCH = {
            value = 8388608, description = "Doesn't generate touch functions, calls ENTITY:EndTouch when this flag gets set during a touch callback"
        },
        FL_BASEVELOCITY = {
            value = 16777216, description = "Base velocity has been applied this frame (used to convert base velocity into momentum)"
        },
        FL_WORLDBRUSH = {
            value = 33554432, description = "This entity is a brush and part of the world"
        },
        FL_OBJECT = {
            value = 67108864, description = "This entity can be seen by NPCs"
        },
        FL_KILLME = {
            value = 134217728, description = "This entity is about to get removed"
        },
        FL_ONFIRE = {
            value = 268435456, description = "This entity is on fire"
        },
        FL_DISSOLVING = {
            value = 536870912, description = "The entity is currently dissolving"
        },
        FL_TRANSRAGDOLL = {
            value = 1073741824, description = "This entity is about to become a ragdoll"
        },
        FL_UNBLOCKABLE_BY_PLAYER = {
            value = -2147483648, description = "This moving door can't be blocked by the player"
        },
    },

    Convar = {
        FCVAR_UNREGISTERED = {
            value = 1, description = "If this is set, the convar will become anonymous and won't show up in the 'find' results"
        },
        FCVAR_GAMEDLL = {
            value = 4, description = "ConVar is defined by the game DLL"
        },
        FCVAR_CLIENTDLL = {
            value = 8, description = "ConVar is defined by the client DLL"
        },
        FCVAR_PROTECTED = {
            value = 32, description = "Makes the ConVar value hidden from all clients ( For example sv_password )"
        },
        FCVAR_SPONLY = {
            value = 64, description = "Executing the command or changing the ConVar is only allowed in singleplayer"
        },
        FCVAR_ARCHIVE = {
            value = 128, description = "Save the ConVar value into client.vdf"
        },
        FCVAR_NOTIFY = {
            value = 256, description = "For serverside ConVars, notifies all players with blue chat text when the value gets changed"
        },
        FCVAR_USERINFO = {
            value = 512, description = "For clientside commands, sends the value to the server"
        },
        FCVAR_PRINTABLEONLY = {
            value = 1024, description = "Forces the ConVar to only have printable characters ( No control characters )"
        },
        FCVAR_UNLOGGED = {
            value = 2048, description = "Don't log the ConVar changes to console/log files/users"
        },
        FCVAR_REPLICATED = {
            value = 8192, description = "For serverside ConVars, it will send its value to all clients. The ConVar with the same name must also exist on the client!"
        },
        FCVAR_CHEAT = {
            value = 16384, description = "Requires sv_cheats to be enabled to change the ConVar or run the command"
        },
        FCVAR_NEVER_AS_STRING = {
            value = 4096, description = "Tells the engine to never print this variable as a string. This is used for variables which may contain control characters"
        },
        FCVAR_DEMO = {
            value = 65536, description = "Force the ConVar to be recorded by demo recordings"
        },
        FCVAR_DONTRECORD = {
            value = 131072, description = "Opposite of FCVAR_DEMO, ensures the ConVar is not recorded in demos"
        },
        FCVAR_LUA_CLIENT = {
            value = 262144, description = "Set automatically on all ConVars and console commands created by the client Lua state"
        },
        FCVAR_LUA_SERVER = {
            value = 524288, description = "Set automatically on all ConVars and console commands created by the server Lua state"
        },
        FCVAR_NOT_CONNECTED = {
            value = 4194304, description = "Makes the ConVar not changeable while connected to a server or in singleplayer"
        },
        FCVAR_ARCHIVE_XBOX = {
            value = 16777216, description = "Save the ConVar value into config.vdf on XBox"
        },
        FCVAR_SERVER_CAN_EXECUTE = {
            value = 268435456, description = "The server is allowed to execute this command on clients"
        },
        FCVAR_SERVER_CANNOT_QUERY = {
            value = 536870912, description = "Prevents the server from querying value of this ConVar"
        },
        FCVAR_CLIENTCMD_CAN_EXECUTE = {
            value = 1073741824, description = "IVEngineClient::ClientCmd is allowed to execute this command"
        },
        FCVAR_NONE = {
            value = 0, description = "No flags"
        },
    },

    Texture = {
        TEXTUREFLAGS_POINTSAMPLE = {
            value = 1, description = "Low quality, 'pixel art' texture filtering"
        },
        TEXTUREFLAGS_TRILINEAR = {
            value = 2, description = "Medium quality texture filtering"
        },
        TEXTUREFLAGS_CLAMPS = {
            value = 4, description = "Clamp S coordinates"
        },
        TEXTUREFLAGS_CLAMPT = {
            value = 8, description = "Clamp T coordinates"
        },
        TEXTUREFLAGS_ANISOTROPIC = {
            value = 16, description = "High quality texture filtering"
        },
        TEXTUREFLAGS_HINT_DXT5 = {
            value = 32, description = "Used in skyboxes. Makes sure edges are seamless"
        },
        TEXTUREFLAGS_PWL_CORRECTED = {
            value = 64, description = "Used for correction in textures. Purpose may vary"
        },
        TEXTUREFLAGS_NORMAL = {
            value = 128, description = "Texture is a normal map"
        },
        TEXTUREFLAGS_NOMIP = {
            value = 256, description = "Render largest mipmap only. (Does not delete existing mipmaps, just disables them)"
        },
        TEXTUREFLAGS_NOLOD = {
            value = 512, description = "Not affected by texture resolution settings"
        },
        TEXTUREFLAGS_ALL_MIPS = {
            value = 1024, description = "No Minimum Mipmap"
        },
        TEXTUREFLAGS_PROCEDURAL = {
            value = 2048, description = "Texture is an procedural texture (code can modify it)"
        },
        TEXTUREFLAGS_ONEBITALPHA = {
            value = 4096, description = "One bit alpha channel used"
        },
        TEXTUREFLAGS_EIGHTBITALPHA = {
            value = 8192, description = "Eight bit alpha channel used"
        },
        TEXTUREFLAGS_ENVMAP = {
            value = 16384, description = "Texture is an environment map"
        },
        TEXTUREFLAGS_RENDERTARGET = {
            value = 32768, description = "Texture is a render target"
        },
        TEXTUREFLAGS_DEPTHRENDERTARGET = {
            value = 65536, description = "Texture is a depth render target"
        },
        TEXTUREFLAGS_NODEBUGOVERRIDE = {
            value = 131072, description = "Texture is not subject to debug override settings"
        },
        TEXTUREFLAGS_SINGLECOPY = {
            value = 262144, description = "Texture stays as a single copy, likely not replicable"
        },
        TEXTUREFLAGS_UNUSED_00080000 = {
            value = 524288, description = "Unused flag, reserved for future use"
        },
        TEXTUREFLAGS_IMMEDIATE_CLEANUP = {
            value = 1048576, description = "Immediately destroy this texture when its reference count hits zero"
        },
        TEXTUREFLAGS_UNUSED_00200000 = {
            value = 2097152, description = "Unused flag, reserved for future use"
        },
        TEXTUREFLAGS_UNUSED_00400000 = {
            value = 4194304, description = "Unused flag, reserved for future use"
        },
        TEXTUREFLAGS_NODEPTHBUFFER = {
            value = 8388608, description = "Do not buffer for Video Processing, generally render distance"
        },
        TEXTUREFLAGS_UNUSED_01000000 = {
            value = 16777216, description = "Unused flag, reserved for future use"
        },
        TEXTUREFLAGS_CLAMPU = {
            value = 33554432, description = "Clamp U coordinates (for volumetric textures)"
        },
        TEXTUREFLAGS_VERTEXTEXTURE = {
            value = 67108864, description = "Usable as a vertex texture"
        },
        TEXTUREFLAGS_SSBUMP = {
            value = 134217728, description = "Texture is a SSBump. (SSB)"
        },
        TEXTUREFLAGS_UNUSED_10000000 = {
            value = 268435456, description = "Unused flag, reserved for future use"
        },
        TEXTUREFLAGS_BORDER = {
            value = 536870912, description = "Clamp to border colour on all texture coordinates"
        },
        TEXTUREFLAGS_UNUSED_40000000 = {
            value = 1073741824, description = "Unused flag, reserved for future use"
        },
        TEXTUREFLAGS_UNUSED_80000000 = {
            value = 2147483648, description = "Unused flag, reserved for future use"
        },
    }
}
