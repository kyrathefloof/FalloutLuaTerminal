-- require filesys and computer
local computer = require("computer") 
local environmentType = "OpenComputers"

-- Utilities
local function clearTerm()
    if environmentType == "Windows_NT" then
        os.execute("cls")
    elseif environmentType == "OpenComputers" then
        os.execute("clear")
    else
        print("Cannot clear terminal. Unknown environmentType.")
    end
end

-- A Function to write
local function writeLog(content)
    local filepath = "/home/fallout_terminal_core/log.txt"
    
    -- Read the current contents of the file
    local file = io.open(filepath, "r")
    local content = ""
    if file then
        content = file:read("*all")
        file:close()
    end

    -- Add new entry to the content
    content = content .. "\n"
    
    -- Write the updated content back to the file
    file = io.open(filepath, "w")
    if file then
        file:write(content)
        file:close()
    else
        error("Unable to open file for writing")
    end
end
-- Print Checkup
clearTerm()
print([[
FOX TEK TERMINAL

Starting self-checkup.

Version 0.1.0a (A1000A)
FIRST OS RELEASE
OpenOS Based
Developer Preview
]])

-- WIPE LOGS
local logtowipe = io.open("/home/fallout_terminal_core/log.txt")
if logtowipe then
    logtowipe:write("")
    logtowipe:close()
else
    -- Freeze the system.
    dofile("/home/fallout_terminal_core/init/init.lua")
end


writeLog([[
[ SYSTEM ] Running init/poweron.lua
]])
-- Check if files exist
local files = {
    "/home/fallout_terminal_core/main/main.lua",
    "/home/fallout_terminal_core/commands/recreationChat.lua",
    "/home/fallout_terminal_core/commands/about_print.lua",
    "/home/fallout_terminal_core/commands/admin_init.lua",
    "/home/fallout_terminal_core/commands/admin.lua",
    "/home/fallout_terminal_core/commands/readlog.lua",
    "/home/fallout_terminal_core/init/init.lua", -- Infinite loop if this doesnt exist.
    "/home/fallout_terminal_core/init/poweron.lua", -- Kinda useless.
    "/home/fallout_terminal_core/utils/restore.lua"
}
local function fileExists(filePath)
    local file = io.open(filePath, "r")
    if file then
        file:close()
        return true
    else
        return false
    end
end

local noErrors = true
local mainFilePresent = true
for _, filePath in ipairs(files) do
    if not fileExists(filePath) then
        local fileName = filePath:match("([^/\\]+)$")
        writeLog([[

[ CRITICAL ]
Error missing ]] .. fileName .. [[
Cannot continue without file...
Aborting.
            ]])
        if fileName == "main.lua" then
            mainFilePresent = false
        end
        noErrors = false
    end
end

if not noErrors then
    print("The script will attempt to boot into the main file. Otherwise the system will lock.")
end
-- Attempt to boot into main, if not boot into lock
if not mainFilePresent then
    if fs.exists("/home/fallout_terminal_core/init/init.lua") then
        dofile("/home/fallout_terminal_core/init/init.lua")
    else
        os.shutdown()
    end
else
    dofile("/home/fallout_terminal_core/main/main.lua")
end

