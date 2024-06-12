local args = {...}

if args[1] == nil then
    print("Usage: clock <interval>")
    return
end

local interval = tonumber(args[1])
local numberOfTicks = 10
local strength = 4

for i=0,numberOfTicks,1 do
    print("Setting left to strength: "..strength)
    redstone.setAnalogOutput("left", strength)
    sleep(interval)
    print("Setting left to zero...")
    redstone.setAnalogOutput("left", 0)
    sleep(interval)
end
