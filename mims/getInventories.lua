local function newLine(numLines)
    local x,y = monitors[1].getCursorPos()
    monitors[1].setCursorPos(1,y+numLines)
end

monitors[1].setCursorPos(1, 1)

outputFile = io.open("inventoriesOutput.json","w")
while not GetKillSwitch() do
    local jsonTable = {}
    monitors[1].setTextScale(1)
    monitors[1].clear()    
    print("Reading inventories...")
    for invIndex,invBlock in pairs(_G.chests) do
        local chestName = peripheral.getName(invBlock)
        monitors[1].write("======="..chestName.."=======")
        newLine(1)
        local chestData = {["name"]=chestName,["slots"]=invBlock.list()}
        for slot, item in pairs(chestData.slots) do
            monitors[1].write(("%d x %s in slot %d"):format(item.count, item.name, slot))
            newLine(1)
        end
        table.insert(jsonTable, chestData)
        monitors[1].write("===============================")
        newLine(2)
    end    
    outputFile:write(dumpvar(jsonTable))
    print("Output file updated; log on monitor...")
    print("Sleeping for 60 seconds...")
    print("")
    sleep(60)
    term.clear()
end
outputFile:close()
