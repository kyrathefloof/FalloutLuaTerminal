local environmentType = os.getenv("OS") or "OpenComputers"
local computer = require("computer")
print([[
Administrator Access Only.

Please input the code below:

]])
local function wait(seconds)
    if not skipTimeouts then
        if environmentType == "Windows_NT" then
            os.execute("timeout " .. seconds .. " >nul")
        elseif environmentType == "OpenComputers" then
            os.execute("sleep " .. seconds)
        else
            print("Wait function not implemented for this environment type.")
        end
    end
end
local function clearTerm()
    if environmentType == "Windows_NT" then
        os.execute("cls")
    elseif environmentType == "OpenComputers" then
        os.execute("clear")
    else
        print("Cannot clear terminal. Unknown environmentType.")
    end
end
local code = "0511"
local input = io.read()

local function granted()
    print([[
Access Granted.
Restoring Run-On-Start script.
    ]])
    local finished = false
    for i = 1, 10 do
        wait(1)
        clearTerm()
        
        io.write("Writing to file ".. i.. "0%")
        if i == 10 then
            finished = true
            io.write("\n")
        end
    end
    if finished == true then
        local shrcContent = [[
lua /home/fallout_terminal_core/main/main.lua
]]



-- Function to write content to .shrc
local function writeShrc()
    local file = io.open("/home/.shrc", "w")
    if file then
        file:write(shrcContent)
        file:close()
        print("Successfully wrote the script to /home/.shrc")
    else
        print("Failed to open /home/.shrc for writing")
    end
end

-- Call the function to write to .shrc
writeShrc()
        print([[
Fox-Tek Terminal
ADMIN FILE == .shrc RESTORE
>> COMPLETE

>> SYSTEM WILL NOW SHUTDOWN <<
    ]])
    print("ARE YOU SURE YOU'D LIKE TO POWER OFF?\nY\\N\n(AUTOFILL) Y")
    print("Powering off.")
    wait(5)
    computer.shutdown(true)
    end
end
if code == input then
    granted()
else
    dofile("/home/fallout_terminal_core/main/main.lua")
end

