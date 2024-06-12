-- Define Global Kill Switch Info
_G.SetKillSwitchSide = "top"
function getKillSwitch()
    return redstone.getInput(_G.SetKillSwitchSide)
end
_G.GetKillSwitch = getKillSwitch

-- Get connected devices by side or network name
local connectedDevices = peripheral.getNames()
local numOfDevices = #(connectedDevices)

_G.chests = {}

if numOfDevices > 0 then
    print("")
    print("==== Found Devices ====")
    for i=1,numOfDevices,1 do        
        print(connectedDevices[i])
        if string.find(connectedDevices[i], "chest") then
            local chest = peripheral.wrap(connectedDevices[i])
            table.insert(_G.chests, chest)
        end
    end
    print("=======================")
end



