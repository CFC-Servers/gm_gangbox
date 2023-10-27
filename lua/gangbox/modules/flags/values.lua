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
--- @field EntitySpawn gb.FlagSet
--- @field EntitySolid gb.FlagSet
--- @field EntityEngine gb.FlagSet
--- @field Texture gb.FlagSet
--- @field Contents gb.FlagSet
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

    --- FL_ Entity Flags (:GetFlags())
    Entity = {
        FL_ONGROUND = {
            value = 1, description = "Entity is on the ground"
        },
        FL_DUCKING = {
            value = 2, description = "Entity is Ducking"
        },
        FL_ANIMDUCKING = {
            value = 4, description = "The player is in the process of ducking or standing up"
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
            value = 256, description = "Entity is a Player"
        },
        FL_FAKECLIENT = {
            value = 512, description = "Bots have this flag"
        },
        FL_INWATER = {
            value = 1024, description = "Entity is in the water"
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
            value = 32768, description = "Player has God Mode enabled"
        },
        FL_NOTARGET = {
            value = 65536, description = "Entity is invisible to AI"
        },
        FL_AIMTARGET = {
            value = 131072, description = "This entity can be aimed at"
        },
        FL_PARTIALGROUND = {
            value = 262144, description = "Not all corners are valid"
        },
        FL_STATICPROP = {
            value = 524288, description = "Entity is a Static Prop"
        },
        FL_GRAPHED = {
            value = 1048576, description = "worldgraph has this ent listed as something that blocks a connection"
        },
        FL_GRENADE = {
            value = 2097152, description = "This entity is a grenade (unused)"
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

    --- Entity Spawn SF_ bitflags (:GetSpawnFlags())
    --- TODO: How to handle entity-specific spawn flags?
    --- I commented out the ones that seem less likely to be used
    EntitySpawn = {
        SF_NPC_WAIT_TILL_SEEN = {
            value = 1, description = "Wait till seen"
        },
        SF_NPC_GAG = {
            value = 2, description = "No IDLE sounds until angry"
        },
        SF_NPC_FALL_TO_GROUND = {
            value = 4, description = "If not set, means teleport to ground"
        },
        -- SF_PHYSPROP_MOTIONDISABLED = {
        --     value = 8, description = "If set, calls PhysObj:EnableMotion( false ) on the func_physbox when the physics are created. See Physics optimization."
        -- },
        SF_NPC_DROP_HEALTHKIT = {
            value = 8, description = "NPC Drops health kit when it dies"
        },
        SF_NPC_START_EFFICIENT = {
            value = 16, description = "Don't acquire enemies or avoid obstacles"
        },
        SF_NPC_WAIT_FOR_SCRIPT = {
            value = 128, description = "Wait for script"
        },
        SF_NPC_LONG_RANGE = {
            value = 256, description = "Long Visibility/Shoot"
        },
        SF_NPC_FADE_CORPSE = {
            value = 512, description = "Fade Corpse"
        },
        -- SF_FLOOR_TURRET_CITIZEN = {
        --     value = 512, description = "Makes the floor turret friendly"
        -- },
        SF_NPC_ALWAYSTHINK = {
            value = 1024, description = "Think outside PVS"
        },
        SF_NPC_TEMPLATE = {
            value = 2048, description = "This entity is a template for the npc_template_maker. It will not spawn automatically and cannot be used with point_template."
        },
        SF_NPC_ALTCOLLISION = {
            value = 4096, description = "Do Alternate collision for this NPC (player avoidance)"
        },
        SF_NPC_NO_WEAPON_DROP = {
            value = 8192, description = "NPC Doesn't drop weapon on death"
        },
        SF_NPC_NO_PLAYER_PUSHAWAY = {
            value = 16384, description = "Ignore player push - Don't give way to player"
        },
        SF_PHYSBOX_MOTIONDISABLED = {
            value = 32768, description = "If set, calls PhysObj:EnableMotion( false ) on the func_physbox when the physics are created"
        },
        SF_CITIZEN_FOLLOW = {
            value = 65536, description = "Follow the player as soon as I spawn"
        },
        -- SF_ROLLERMINE_FRIENDLY = {
        --     value = 65536, description = "Makes the rollermine friendly."
        -- },
        SF_CITIZEN_MEDIC = {
            value = 131072, description = "Makes the citizen a medic"
        },
        SF_CITIZEN_RANDOM_HEAD = {
            value = 262144, description = "Gives the citizen a random head"
        },
        SF_CITIZEN_AMMORESUPPLIER = {
            value = 524288, description = "Citizen that resupplies ammo"
        },
        SF_PHYSBOX_ALWAYS_PICK_UP = {
            value = 1048576, description = "Gravity gun is ALWAYS allowed to pick this up."
        },
        -- SF_CITIZEN_NOT_COMMANDABLE = {
        --     value = 1048576, description = "Citizen cannot join players squad, and will not able to be commanded by the Half-Life 2 command system for Citizens"
        -- },
        -- SF_CITIZEN_IGNORE_SEMAPHORE = {
        --     value = 2097152, description = "Work outside the speech semaphore system"
        -- },
        SF_PHYSBOX_NEVER_PICK_UP = {
            value = 2097152, description = "Gravity gun is NOT allowed to pick this up."
        },
        -- SF_CITIZEN_RANDOM_HEAD_MALE = {
        --     value = 4194304, description = "Gives the citizen a random male head"
        -- },
        SF_PHYSBOX_NEVER_PUNT = {
            value = 4194304, description = "Gravity gun is NOT allowed to punt this entity."
        },
        SF_CITIZEN_RANDOM_HEAD_FEMALE = {
            value = 8388608, description = "Gives the citizen a random female head"
        },
        SF_CITIZEN_USE_RENDER_BOUNDS = {
            value = 16777216, description = "Use render bounds instead of human hull for guys sitting in chairs, etc. Must be set before Spawn() is called to take effect"
        },
    },

    --- Entity Solid flags (:GetSolidFlags())
    EntitySolid = {
        FSOLID_CUSTOMRAYTEST = {
            value = 1, description = "Ignore solid type + always call into the entity for ray tests"
        },
        FSOLID_CUSTOMBOXTEST = {
            value = 2, description = "Ignore solid type + always call into the entity for swept box tests"
        },
        FSOLID_NOT_SOLID = {
            value = 4, description = "The object is currently not solid"
        },
        FSOLID_TRIGGER = {
            value = 8, description = "This is something may be collideable but fires touch functions even when it's not collideable (when the FSOLID_NOT_SOLID flag is set)"
        },
        FSOLID_MAX_BITS = {
            value = 10, description = "The amount of bits needed to store the all the flags in a variable/sent over network."
        },
        FSOLID_NOT_STANDABLE = {
            value = 16, description = "Players can't stand on this"
        },
        FSOLID_VOLUME_CONTENTS = {
            value = 32, description = "Contains volumetric contents (like water)"
        },
        FSOLID_FORCE_WORLD_ALIGNED = {
            value = 64, description = "Forces the collision representation to be world-aligned even if it's SOLID_BSP or SOLID_VPHYSICS"
        },
        FSOLID_USE_TRIGGER_BOUNDS = {
            value = 128, description = "Uses a special trigger bounds separate from the normal OBB"
        },
        FSOLID_ROOT_PARENT_ALIGNED = {
            value = 256, description = "Collisions are defined in root parent's local coordinate space"
        },
        FSOLID_TRIGGER_TOUCH_DEBRIS = {
            value = 512, description = "This trigger will touch debris objects"
        },
    },

    --- Entity EFL_ bitflags (:GetEFlags())
    EntityEngine = {
        EFL_KILLME = {
            value = 1, description = "This entity is marked for death -- This allows the game to actually delete ents at a safe time."
        },
        EFL_DORMANT = {
            value = 2, description = "Entity is dormant, no updates to client"
        },
        EFL_NOCLIP_ACTIVE = {
            value = 4, description = "Lets us know when the noclip command is active"
        },
        EFL_SETTING_UP_BONES = {
            value = 8, description = "Set while a model is setting up its bones"
        },
        -- EFL_KEEP_ON_RECREATE_ENTITIES = {
        --     value = 16, description = "This is a special entity that should not be deleted when we restart entities only"
        -- },
        EFL_HAS_PLAYER_CHILD = {
            value = 16, description = "One of the child entities is a player"
        },
        EFL_DIRTY_SHADOWUPDATE = {
            value = 32, description = "(Client only) need shadow manager to update the shadow"
        },
        EFL_NOTIFY = {
            value = 64, description = "Another entity is watching events on this entity (used by teleport)"
        },
        EFL_FORCE_CHECK_TRANSMIT = {
            value = 128, description = "The default behavior in ShouldTransmit is to not send an entity if it doesn't have a model. Certain entities want to be sent anyway because all the drawing logic is in the client DLL. They can set this flag and the engine will transmit them even if they don't have model"
        },
        EFL_BOT_FROZEN = {
            value = 256, description = "This is set on bots that are frozen"
        },
        EFL_SERVER_ONLY = {
            value = 512, description = "Non-networked entity"
        },
        EFL_NO_AUTO_EDICT_ATTACH = {
            value = 1024, description = "Don't attach the edict"
        },
        EFL_DIRTY_ABSTRANSFORM = {
            value = 2048, description = "?"
        },
        EFL_DIRTY_ABSVELOCITY = {
            value = 4096, description = "?"
        },
        EFL_DIRTY_ABSANGVELOCITY = {
            value = 8192, description = "Some dirty bits with respect to abs computations"
        },
        EFL_DIRTY_SURROUNDING_COLLISION_BOUNDS = {
            value = 16384, description = "?"
        },
        EFL_DIRTY_SPATIAL_PARTITION = {
            value = 32768, description = "?"
        },
        EFL_IN_SKYBOX = {
            value = 131072, description = "This is set if the entity detects that it's in the skybox. This forces it to pass the 'in PVS' for transmission"
        },
        EFL_USE_PARTITION_WHEN_NOT_SOLID = {
            value = 262144, description = "Entity shows up in the partition even when not solid"
        },
        EFL_TOUCHING_FLUID = {
            value = 524288, description = "Used to determine if an entity is floating"
        },
        EFL_IS_BEING_LIFTED_BY_BARNACLE = {
            value = 1048576, description = "?"
        },
        EFL_NO_ROTORWASH_PUSH = {
            value = 2097152, description = "?"
        },
        EFL_NO_THINK_FUNCTION = {
            value = 4194304, description = "Avoid executing the entity's Think"
        },
        EFL_NO_GAME_PHYSICS_SIMULATION = {
            value = 8388608, description = "?"
        },
        EFL_CHECK_UNTOUCH = {
            value = 16777216, description = "?"
        },
        EFL_DONTBLOCKLOS = {
            value = 33554432, description = "Entity shouldn't block NPC line-of-sight"
        },
        EFL_DONTWALKON = {
            value = 67108864, description = "NPCs should not walk on this entity"
        },
        EFL_NO_DISSOLVE = {
            value = 134217728, description = "The entity shouldn't dissolve"
        },
        EFL_NO_MEGAPHYSCANNON_RAGDOLL = {
            value = 268435456, description = "Mega physcannon can't ragdoll these guys"
        },
        EFL_NO_WATER_VELOCITY_CHANGE = {
            value = 536870912, description = "Don't adjust this entity's velocity when transitioning into water"
        },
        EFL_NO_PHYSCANNON_INTERACTION = {
            value = 1073741824, description = "Physcannon can't pick these up or punt them"
        },
        EFL_NO_DAMAGE_FORCES = {
            value = -2147483648, description = "Doesn't accept forces from physics damage"
        }
    },

    --- Convar FCVAR_ bitflags
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
    },

    --- Surface SURF_ bitflags, used in TraceResult structures
    Surface = {
        SURF_LIGHT = {
            value = 1, description = "Value will hold the light strength"
        },
        SURF_SKY2D = {
            value = 2, description = "This surface is a 2D skybox"
        },
        SURF_SKY = {
            value = 4, description = "This surface is a skybox, equivalent to HitSky in Structures/TraceResult"
        },
        SURF_WARP = {
            value = 8, description = "This surface is animated water"
        },
        SURF_TRANS = {
            value = 16, description = "This surface is translucent"
        },
        SURF_NOPORTAL = {
            value = 32, description = "This surface cannot have portals placed on, used by Portal's gun"
        },
        SURF_TRIGGER = {
            value = 64, description = "This surface is a trigger"
        },
        SURF_NODRAW = {
            value = 128, description = "This surface is an invisible entity, equivalent to HitNoDraw in Structures/TraceResult"
        },
        SURF_HINT = {
            value = 256, description = "Make a primary bsp splitter"
        },
        SURF_SKIP = {
            value = 512, description = "This surface can be ignored by impact effects"
        },
        SURF_NOLIGHT = {
            value = 1024, description = "This surface has no lights calculated"
        },
        SURF_BUMPLIGHT = {
            value = 2048, description = "Three lightmaps are calculated for this surface for bumpmapping"
        },
        SURF_NOSHADOWS = {
            value = 4096, description = "No shadows are cast on this surface"
        },
        SURF_NODECALS = {
            value = 8192, description = "No decals are applied to this surface"
        },
        SURF_NOCHOP = {
            value = 16384, description = "Patches are not subdivided on this surface"
        },
        SURF_HITBOX = {
            value = 32768, description = "This surface is part of an entity's hitbox"
        }
    },

    --- Displacement Surface DISPSURF_ bitflags, used in TraceResult structures
    DispSurface = {
        DISPSURF_SURFACE = {
            value = 1, description = "Surface is Displacement"
        },
        DISPSURF_WALKABLE = {
            value = 2, description = "Displacement is walkable"
        },
        DISPSURF_BUILDABLE = {
            value = 4, description = "?"
        },
        DISPSURF_SURFPROP1 = {
            value = 8, description = "?"
        },
        DISPSURF_SURFPROP2 = {
            value = 16, description = "?"
        }
    },

    --- Contents CONTENTS_ flags for PhysObj and others
    Contents = {
        CONTENTS_EMPTY = {
            value = 0, description = "Things that are not solid"
        },
        CONTENTS_SOLID = {
            value = 1, description = "Things that are solid"
        },
        CONTENTS_WINDOW = {
            value = 2, description = "Glass"
        },
        CONTENTS_AUX = {
            value = 4, description = "?"
        },
        CONTENTS_GRATE = {
            value = 8, description = "Bullets go through, solids don't"
        },
        CONTENTS_SLIME = {
            value = 16, description = "?"
        },
        CONTENTS_WATER = {
            value = 32, description = "Hits world but not skybox"
        },
        CONTENTS_BLOCKLOS = {
            value = 64, description = "Things that block line of sight"
        },
        CONTENTS_OPAQUE = {
            value = 128, description = "Things that block light"
        },
        CONTENTS_TESTFOGVOLUME = {
            value = 256, description = "?"
        },
        CONTENTS_TEAM4 = {
            value = 512, description = "?"
        },
        CONTENTS_TEAM3 = {
            value = 1024, description = "?"
        },
        CONTENTS_TEAM1 = {
            value = 2048, description = "?"
        },
        CONTENTS_TEAM2 = {
            value = 4096, description = "?"
        },
        CONTENTS_IGNORE_NODRAW_OPAQUE = {
            value = 8192, description = "?"
        },
        CONTENTS_MOVEABLE = {
            value = 16384, description = "?"
        },
        CONTENTS_AREAPORTAL = {
            value = 32768, description = "?"
        },
        CONTENTS_PLAYERCLIP = {
            value = 65536, description = "?"
        },
        CONTENTS_MONSTERCLIP = {
            value = 131072, description = "?"
        },
        CONTENTS_CURRENT_0 = {
            value = 262144, description = "?"
        },
        CONTENTS_CURRENT_180 = {
            value = 1048576, description = "?"
        },
        CONTENTS_CURRENT_270 = {
            value = 2097152, description = "?"
        },
        CONTENTS_CURRENT_90 = {
            value = 524288, description = "?"
        },
        CONTENTS_CURRENT_DOWN = {
            value = 8388608, description = "?"
        },
        CONTENTS_CURRENT_UP = {
            value = 4194304, description = "?"
        },
        CONTENTS_DEBRIS = {
            value = 67108864, description = "?"
        },
        CONTENTS_DETAIL = {
            value = 134217728, description = "?"
        },
        CONTENTS_HITBOX = {
            value = 1073741824, description = "Hitbox"
        },
        CONTENTS_LADDER = {
            value = 536870912, description = "Ladder"
        },
        CONTENTS_MONSTER = {
            value = 33554432, description = "NPCs"
        },
        CONTENTS_ORIGIN = {
            value = 16777216, description = "?"
        },
        CONTENTS_TRANSLUCENT = {
            value = 268435456, description = "Hits world but not skybox"
        }
    },
}
