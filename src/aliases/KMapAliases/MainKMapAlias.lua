local kmapcmd = matches[2]

local kmaparray = string.split(kmapcmd)

local object = kmaparray[1]

-- object is map for these essentially, so these are more like actions
if object == "start" then
    map.start_mapping(args)
elseif object == "stop" then
    raiseEvent("mapStop")
    raiseEvent("sysSpeedwalkStopped")
elseif object == "help" then
    local args = table.concat(kmaparray, " ", 2, table.size(kmaparray))
    map.show_help(args)
elseif object == "save" then
    if saveMap(getMudletHomeDir() .. "/kmapdata/map.dat") and saveJsonMap(getMudletHomeDir() .. "/kmapdata/kmap.json") then
        map.log("Map saved.\n", "INFO")
    else
        map.log("Error.  Map NOT saved.\n", "ERROR")
    end
				
end

if object == "area" then
    local action = kmaparray[2]
    local args = table.concat(kmaparray, " ", 3, table.size(kmaparray))
    if action == "get" then
        enableTrigger("KArea Capture Data")
        send("area "..args)
    elseif action == "del" then
        map.deleteArea(args, true)
    elseif action == "list" then
        map.echoAreaList()
    end
end
    

