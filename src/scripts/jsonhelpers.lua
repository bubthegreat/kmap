function writejsonalphasort(lua_object, filename)

    -- Requires the dkjson.lua file.
    local json = require("kmap.dkjson")
    
    local a = {}
    for n in pairs(lua_object) do table.insert(a, n) end
    table.sort(a)
    
    local json_string = json.encode(lua_object, {
    indent = true,
    keyorder = a -- Keys not in this list follow afterwards
    })
    
    -- Print the resulting indented JSON string
    -- cecho(json_string)
    
    local file = io.open(filename, "w") -- Open in write mode
    if file then
        file:write(json_string)
        file:close()                 -- Close the file handle
    else
        cecho("Error: Unable to open file for writing.\n")
    end

end

function readjson(filename)

    local json_string = ""
    local file = io.open(filename, "r")
    if file then
        json_string = file:read("*all")
        file:close()
    else
        cecho("Error: Unable to open file for reading.\n")
    end
    --display(json_string)
    local json = require("kmap.dkjson")

    -- Decode the string
    local lua_table, pos, err = json.decode(json_string, pos, null, nil)

    -- Check for errors
    if err then
        print("Error decoding JSON: " .. err)
    else
        return lua_table
    end
end