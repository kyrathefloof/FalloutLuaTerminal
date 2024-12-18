-- admin.lua

local environmentType = "OpenComputers"
-- log
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

-- Admin Interface
local function admin()
    clearTerm()
    print("Input a command:")
    local input = io.read()
    if input == "sysdiag" then
        print([[
Feature Unavailable
        ]])
    elseif input == "log" then
        print("Entering log.")
        os.sleep(5)
        dofile("/home/fallout_terminal_core/commands/readlog.lua")
    end
end
clearTerm()
print([[
Administrator Access Only.

Please input the code below:
]])

local code = "0511"
local input = io.read()

if code == input then
    clearTerm()
    print([[
Welcome!
Operations Panel will open shortly.
    ]])
    admin()
else
    clearTerm()
    print([[
Console Locked
Anti Tampering lock activated.
    ]])
    os.sleep(5)
    dofile("/home/fallout_terminal_core/commands/admin_init.lua")
end