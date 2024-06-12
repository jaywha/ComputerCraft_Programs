while not _G.GetKillSwitch() do
    for invIndex,invBlock in pairs(_G.chests) do
        print("======="..peripheral.getName(invBlock).."=======")
        for slot, item in pairs(invBlock.list()) do
            print(("%d x %s in slot %d"):format(item.count, item.name, slot))
        end
        print("===============================")
        print("")
    end
    sleep(3)
end
