_G.ToggleInvisibleWalls = _G.ToggleInvisibleWalls or {}

local TIW = _G.ToggleInvisibleWalls

if not TIW._inited then
    TIW._inited = true
    TIW.enabled = false
    TIW.last_level_id = nil

    TIW.orig_bullet_masks = TIW.orig_bullet_masks or {}
    TIW.orig_unit_slots   = TIW.orig_unit_slots   or {}

    TIW.collisions = TIW.collisions or {
        ["276de19dc5541f30"] = true, --units/dev_tools/level_tools/dev_collision_1m_2
        ["e379cc9592197cd8"] = true, --units/dev_tools/level_tools/dev_collision_1m_2_bag
        ["8f3cb89b79b42ec4"] = true, --units/dev_tools/level_tools/dev_collision_4m
        ["6cdb4f6f58ec4fa8"] = true, --units/dev_tools/level_tools/dev_collision_4m_bag
        ["7ae8fcbfe6a00f7b"] = true, --units/dev_tools/level_tools/dev_collision_5m
        ["85462a64da94ee78"] = true, --units/dev_tools/level_tools/dev_collision_5m_bag
        ["7a4c85917d8d8323"] = true, --units/dev_tools/level_tools/dev_collision_10m
        ["b37a4188fde4c161"] = true, --units/dev_tools/level_tools/dev_collision_10m_bag
        ["7b91ae618eadbe49"] = true, --units/dev_tools/level_tools/dev_nav_blocker_vehicle_sedan
        ["01c78e4ef0340674"] = true, --units/dev_tools/level_tools/navigation_blocker
        ["adea0368e2fee02b"] = true, --units/dev_tools/level_tools/navigation_blocker_1
        ["42370b3a7b92f537"] = true, --units/dev_tools/level_tools/navigation_blocker_10
        ["39d0838c190f1540"] = true, --units/dev_tools/level_tools/navigation_blocker_20
        ["cacb76e8e1d7e2f3"] = true, --units/dev_tools/level_tools/navigation_blocker_50
        ["c746af9ae100c837"] = true, --units/dev_tools/level_tools/navigation_blocker_hlf
        ["75baea8dccabc8d5"] = true, --units/dev_tools/level_tools/dev_bag_collision/dev_bag_collision_1x1m
        ["4027cbad1f8d5b37"] = true, --units/dev_tools/level_tools/dev_bag_collision/dev_bag_collision_1x3m
        ["9b2fcf39f23e2344"] = true, --units/dev_tools/level_tools/dev_bag_collision/dev_bag_collision_4x3m
        ["d678a2a41e3f1bfb"] = true, --units/dev_tools/level_tools/dev_bag_collision/dev_bag_collision_4x32m
        ["0fe54fe3af59d86c"] = true, --units/dev_tools/level_tools/dev_bag_collision/dev_bag_collision_8x3m
        ["2854ee0748613f72"] = true, --units/dev_tools/level_tools/dev_bag_collision/dev_bag_collision_8x32m
        ["16dde5dd77259b35"] = true, --units/dev_tools/level_tools/dev_bag_collision/dev_bag_collision_16x32m
        ["8969155cb42a67cc"] = true, --units/dev_tools/level_tools/dev_bag_collision/dev_bag_collision_64x32m
        ["c5c4442c5e147cb0"] = true, --units/dev_tools/level_tools/collision/dev_collision_1m/dev_collision_1m
        ["9eda9e73ac0ef710"] = true, --units/dev_tools/level_tools/collision/dev_collision_1m/dev_collision_1m_bag
        ["673ea142d68175df"] = true, --units/dev_tools/level_tools/collision/dev_collision_20m/dev_collision_20m
        ["260a42b4809c08dc"] = true, --units/dev_tools/level_tools/collision/dev_collision_20m/dev_collision_20m_bag
        ["9d8b22836aa015ed"] = true, --units/dev_tools/level_tools/collision/dev_collision_50m/dev_collision_50m
        ["78f4407343b48f6d"] = true, --units/dev_tools/level_tools/collision/dev_collision_50m/dev_collision_50m_bag
        ["96eba158d67240f6"] = true, --units/dev_tools/level_tools/dev_collision/dev_collision_1x1m
        ["a3649015ec10f0fa"] = true, --units/dev_tools/level_tools/dev_collision/dev_collision_1x3m
        ["6cb6040856588734"] = true, --units/dev_tools/level_tools/dev_collision/dev_collision_4x3m
        ["97e8d510fc7f6b4b"] = true, --units/dev_tools/level_tools/dev_collision/dev_collision_4x32m
        ["99792495ba726698"] = true, --units/dev_tools/level_tools/dev_collision/dev_collision_8x3m
        ["e765f9d63549a5c5"] = true, --units/dev_tools/level_tools/dev_collision/dev_collision_8x32m
        ["093021865a2c35af"] = true, --units/dev_tools/level_tools/dev_collision/dev_collision_16x32m
        ["a5bab566e1733d44"] = true, --units/dev_tools/level_tools/dev_collision/dev_collision_64x32m
        ["3345b74c3081f3f9"] = true, --units/dev_tools/level_tools/dev_nav_blocker/dev_nav_blocker_1x1m
        ["f9639a083eb4eb0c"] = true, --units/dev_tools/level_tools/dev_nav_blocker/dev_nav_blocker_1x1x3m
        ["8f0bd5d3ce8adf20"] = true, --units/dev_tools/level_tools/dev_nav_blocker/dev_nav_blocker_1x3m
        ["120d0ca08375e85e"] = true, --units/dev_tools/level_tools/dev_nav_blocker/dev_nav_blocker_2x3m
        ["d6ab68fdfb25156e"] = true, --units/dev_tools/level_tools/dev_nav_blocker/dev_nav_blocker_4x3m
        ["77175ed91c87d38a"] = true, --units/dev_tools/level_tools/dev_nav_blocker/dev_nav_blocker_8x3m
        ["89a7dbeb98bb47fb"] = true, --units/dev_tools/level_tools/dev_nav_blocker/dev_nav_blocker_16x3m
        ["67e5497920d65b45"] = true, --units/dev_tools/level_tools/dev_nav_blocker/dev_nav_blocker_64x3m
        ["4385cb1d46044948"] = true, --units/dev_tools/level_tools/dev_vehicle_collision/dev_vehicle_collision_1x1m
        ["75d60c30cfc752d5"] = true, --units/dev_tools/level_tools/dev_vehicle_collision/dev_vehicle_collision_1x3m
        ["6e94e532295a1c4c"] = true, --units/dev_tools/level_tools/dev_vehicle_collision/dev_vehicle_collision_4x3m
        ["b7dd69c3082ad494"] = true, --units/dev_tools/level_tools/dev_vehicle_collision/dev_vehicle_collision_4x32m
        ["03996689587afc9c"] = true, --units/dev_tools/level_tools/dev_vehicle_collision/dev_vehicle_collision_8x3m
        ["fe7682409496395c"] = true, --units/dev_tools/level_tools/dev_vehicle_collision/dev_vehicle_collision_8x32m
        ["20a34b41ca06015c"] = true, --units/dev_tools/level_tools/dev_vehicle_collision/dev_vehicle_collision_16x32m
        ["70fbfdaf5e1c50a1"] = true, --units/dev_tools/level_tools/dev_vehicle_collision/dev_vehicle_collision_64x32m
        ["cbeb471aa32636ea"] = true, --units/dev_tools/level_tools/dev_vehicle_only_collision/dev_vehicle_only_collision_1x1m
        ["7c6a421c90a8709a"] = true, --units/dev_tools/level_tools/dev_vehicle_only_collision/dev_vehicle_only_collision_1x3m
        ["fe13549df62eab40"] = true, --units/dev_tools/level_tools/dev_vehicle_only_collision/dev_vehicle_only_collision_4x3m
        ["df37c0dd7a9e1392"] = true, --units/dev_tools/level_tools/dev_vehicle_only_collision/dev_vehicle_only_collision_4x32m
        ["887ceed0e322a202"] = true, --units/dev_tools/level_tools/dev_vehicle_only_collision/dev_vehicle_only_collision_8x3m
        ["b1f9779228aff5cf"] = true, --units/dev_tools/level_tools/dev_vehicle_only_collision/dev_vehicle_only_collision_8x32m
        ["ea53e01e72a77431"] = true, --units/dev_tools/level_tools/dev_vehicle_only_collision/dev_vehicle_only_collision_16x32m
        ["31245608e2096b2a"] = true  --units/dev_tools/level_tools/dev_vehicle_only_collision/dev_vehicle_only_collision_64x32m
    }
end

local function notify(text)
    if managers and managers.hud and managers.hud.show_hint then
        managers.hud:show_hint({ text = text })
    elseif managers and managers.chat and managers.chat.feed_system_message then
        managers.chat:feed_system_message(text)
    else
        log(text)
    end
end

local function current_level_id()
    if Global and Global.game_settings and Global.game_settings.level_id then
        return tostring(Global.game_settings.level_id)
    end
    if managers and managers.job and managers.job:current_level_id() then
        return tostring(managers.job:current_level_id())
    end
    return "unknown"
end

local function reset_if_new_level()
    local lvl = current_level_id()
    if TIW.last_level_id ~= lvl then
        TIW.last_level_id = lvl
        TIW.enabled = false
        TIW.orig_bullet_masks = {}
        TIW.orig_unit_slots = {}
    end
end

local function set_weapon_bullet_mask(inv, enable_remove)
    if not inv or not inv._available_selections or not World or not World.make_slot_mask then
        return
    end

    for _, sel in pairs(inv._available_selections) do
        if sel and alive(sel.unit) and sel.unit.base and sel.unit:base() then
            local base = sel.unit:base()
            local ukey = sel.unit:key()

            if enable_remove then
                if TIW.orig_bullet_masks[ukey] == nil then
                    TIW.orig_bullet_masks[ukey] = base._bullet_slotmask
                end

                base._bullet_slotmask = World:make_slot_mask(7, 11, 12, 14, 16, 17, 18, 21, 22, 25, 26, 33, 34, 35)
            else
                local orig = TIW.orig_bullet_masks[ukey]
                if orig ~= nil then
                    base._bullet_slotmask = orig
                end
            end
        end
    end
end

local function toggle_collision_units(enable_remove)
    if not World or not World.find_units_quick then
        return
    end

    if enable_remove then
        local units = World:find_units_quick("all", 1) or {}
        for _, unit in pairs(units) do
            if alive(unit) then
                local name_key = unit:name():key()
                if TIW.collisions[name_key] then
                    local ukey = unit:key()
                    if not TIW.orig_unit_slots[ukey] then
                        TIW.orig_unit_slots[ukey] = { unit = unit, slot = unit:slot() }
                        pcall(function()
                            unit:set_slot(0)
                        end)
                    end
                end
            end
        end
    else
        for ukey, data in pairs(TIW.orig_unit_slots) do
            if data and alive(data.unit) then
                pcall(function()
                    data.unit:set_slot(data.slot)
                end)
            end
            TIW.orig_unit_slots[ukey] = nil
        end
    end
end

reset_if_new_level()

if not TIW.enabled then
    set_weapon_bullet_mask(inv, true)
    toggle_collision_units(true)
    TIW.enabled = true
    notify("[IWR] Invisible walls: OFF")
end
