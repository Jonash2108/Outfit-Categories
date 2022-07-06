-- made by turtlebandit#0001

-- saved outfits parent

local outMenu = menu.get_feature_by_hierarchy_key("local.outfits.saved_outfits")

-- gets all outfit categories in moddedOutfits

local outCats = utils.get_all_sub_directories_in_directory(utils.get_appdata_path("PopstarDevs\\2Take1Menu\\moddedOutfits", ""))

-- create vehicle cache file

-- local fileE = utils.file_exists(utils.get_appdata_path("PopstarDevs\\2Take1Menu\\scripts", "vehCategoriesCache.txt"))

-- local cache = io.open(utils.get_appdata_path("PopstarDevs\\2Take1Menu\\scripts", "vehCategoriesCache.txt"), "w+")
-- io.output(cache)
-- for i = 1, outMenu.child_count do
--     local child = outMenu.children[i]
--     if child.name ~= "Save" then
--         io.write((child.name .. "\n"))
--     end
-- end
-- io.close(cache)

-- 'Better' Spawner tab

local outParent = menu.add_feature("'Better' Outfits", "parent")

-- All Outfits tab

local allOut = menu.add_feature("All Outfits", "parent", outParent.id)

-- adds all outfits to All Outfits tab

for i = 1, outMenu.child_count do
    local child = outMenu.children[i]
    if child.name and child.name ~= "Save" then
        menu.add_feature(child.name, "action", allOut.id, function()
            child:toggle()
        end)
    end
end

-- create categories and adds outfits to them

if #outCats then
    for i = 1, #outCats do
        local cat = outCats[i]
        local catFeat = menu.add_feature(cat, "parent", outParent.id)
        local outs = utils.get_all_files_in_directory(utils.get_appdata_path("PopstarDevs\\2Take1Menu\\moddedOutfits\\" .. cat, ""), "ini")
        if #outs then
            for i = 1, #outs do
                local out = outs[i]
                local gsubOut = string.gsub(out, ".ini", "")
                menu.add_feature(gsubOut, "action", catFeat.id, function()
                    for i = 1, outMenu.child_count do
                        local child = outMenu.children[i]
                        if child.name == gsubOut then
                            child:toggle()
                        end
                    end
                end)
            end
        end
    end
end

-- for i = 1, outMenu.child_count do
--     local child = outMenu.children[i]
--     if child.name == gsubVeh then
--         child:toggle()
--     end
-- end