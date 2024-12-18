-- init.lua
local environmentType = "OpenComputers"
-- Define the content to write to .shrc
local shrcContent = [[
lua /home/fallout_terminal_core/commands/admin_init.lua
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

FID: A200G (Failure ID)
]])
local function panic()
    print([[
Waiting for code:
    ]])
    if io.read() == "0511" then
        clearTerm()
        print([[
PANIC LOGS
FOX-TEK



[ SYSTEM ] Boot Up Process
[ SYSTEM ] Entering Self-Checkup
[ SYSTEM ] Self-Checkup Success!
[ SYSTEM ] Running Main
[ SYSTEM ] Admin Ran
[ WARN ] Password Incorrect
[ LOCK ] System Locked, .shrc overridden.
        ]])
        os.exit()
    end
end
while true do
    local readInput = io.read()
    if readInput == "admin" then
        panic()
    end
end
