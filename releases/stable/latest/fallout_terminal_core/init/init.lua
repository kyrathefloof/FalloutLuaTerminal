
-- Written by Kyra Young
-- No, thats not my official name.

-- Version 0.1.0, Fully Locked Down Operating System (FLD-OS)
-- init.lua
local environmentType = "OpenComputers"
-- Define the content to write to .shrc
local shrcContent = [[
lua /home/fallout_terminal_core/init/init.lua
]]

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
    content = content .. "\n" .. new_entry
    
    -- Write the updated content back to the file
    file = io.open(filepath, "w")
    if file then
        file:write(content)
        file:close()
    else
        error("Unable to open file for writing")
    end
end
-- Function to write content to .shrc
local function writeShrc()
    local file = io.open("/home/.shrc", "w")
    if file then
        file:write(shrcContent)
        file:close()
        print("Success")
    else
        print("Unknown Error")
        os.shutdown()
    end
end

-- Call the function to write to .shrc
writeShrc()

-- The rest of your init.lua script

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

clearTerm()
print([[
Fox-Tek Terminal
OUT OF SERVICE
= Authorized Technicians Required =

x_x process died
UwU
]])
local function panic()
    print([[
Waiting for code:
    ]])
    if io.read() == "0511" then
        clearTerm()
        
        
        -- Write an empty string to wipe the file
        -- file:write("")
        -- file:close()
        os.exit()
    end
end
while true do
    local readInput = io.read()
    if readInput == "admin" then
        panic()
    end
end
