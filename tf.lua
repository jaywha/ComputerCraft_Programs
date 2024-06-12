KILL_SWITCH_SIDE = "left"
local countOfTrees = 1
EATING_TIME = 60
REST_TIME = 60


local function mineTree()
    print("Chopping tree #".. countOfTrees .."...")
    local height = 0
    while turtle.detect() do
        turtle.dig()
        while not turtle.up() do
            sleep(1)
        end
        height = height + 1
    end
    shell.run("go","down",height)
    countOfTrees = countOfTrees + 1
end

local function findSapling()
    slotIndex = 1
    
    -- Get current selected slot
    local data = turtle.getItemDetail()
    
    if data ~= nil then    
        while data.name ~= "minecraft:spruce_sapling" do
            slotIndex = slotIndex + 1
            data = turtle.getItemDetail(slotIndex)
        end
    end
    
    turtle.select(slotIndex)
    turtle.transferTo(1)
    turtle.select(1)
end

while redstone.getInput(KILL_SWITCH_SIDE) do
    has_block, data = turtle.inspect()
    if has_block then
        if data.name == "minecraft:spruce_log" then
            sleep(EATING_TIME)
            mineTree()
            sleep(REST_TIME)
        end
    else
        findSapling()
        turtle.place()        
    end
end

print("Kill switch: ON")
