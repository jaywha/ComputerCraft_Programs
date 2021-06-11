local monitor = peripheral.wrap("right")
local monX, monY = monitor.getSize()
local title = "RAMSEY Menu"
local subtitle = "R-Click to start"

function ServeMenu()
    monitor.clear()
    monitor.setCursorPos(1,1)
    monitor.write(title)
    monitor.setCursorPos(1,2)
    monitor.write(subtitle)

    local event, side, x, y = os.pullEvent("monitor_touch")

    if event then
        monitor.clear()
        monitor.setCursorPos(1,1)
        monitor.write("Making bread...")
        shell.run("bread")
        ServeMenu()
    end
end

ServeMenu()
