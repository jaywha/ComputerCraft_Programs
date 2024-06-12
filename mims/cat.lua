local args = {...}
local completion = require "cc.shell.completion"
local complete = completion.build(
{ completion.file })
shell.setCompletionFunction("cat.lua", complete)

if args[1] ~= nil then
    local fileName = args[1]    
    local fileHandle = io.open(fileName, "r")    
    local fileContent = fileHandle:read("*all")
    print(fileContent)
else
    print("Usage: cat <filename>")
end
