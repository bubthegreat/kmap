-- rd <optional room ID, or current if none> <direction> <door status>
-- Direction can be one of the following: e,s,w,n,ne,se,sw,ne. 
-- Door status can be open or o, closed or c, locked or l, clear or gone.
-- To delete a room, use clear or gone. Setting doors is one-way - to set
-- two-way doors, use the alias from the opposite direction.

local room = (matches[2] ~= "" and tonumber(matches[2]) or map.currentRoom)

local direction, status = matches[3], matches[4]

if not roomExists(room) then map.echo("Room "..room.." doesn't exist. It has to before we can make doors in it.") return end

local validdirs = {'e', 's', 'w', 'n', 'ne', 'se', 'sw', 'nw', 'in', 'out', 'up', 'down'}

if not table.contains(validdirs, direction) then
  map.echo("Can't make a door in the '"..direction.."' direction - available choices are:\n  "..table.concat(validdirs, ', '))
  return
end

local statusnum

if status == "" or status == "open" or status == "o" then
  statusnum = 1
elseif status == "closed" or status ==  "c" then
  statusnum = 2
elseif status == "locked" or status ==  "l" then
  statusnum = 3
elseif status == "clear" or status == "gone" then
  statusnum = 0
end

if not statusnum then map.echo("Unrecognized option - a door can be open, closed, locked or gone.") return end

setDoor(room, direction, statusnum)

if statusnum == 0 then
  map.echo("OK, door removed.")
else
  map.echo("OK, door added/adjusted.")
end