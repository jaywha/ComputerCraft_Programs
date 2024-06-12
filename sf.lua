local args = {...}

if args[1] == nil then
    print("Usage: sf <numberOfBlocks>")
    return
end

local reqStone = args[1]
for stoneCounter=1,reqStone do
    while not turtle.detectDown() do
    end
    turtle.digDown()    
end
