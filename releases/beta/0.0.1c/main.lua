local environmentType = os.getenv("OS") or "OpenComputers"
local debug = false
local accessType = "FREE_USE" -- Free_Use, Login_Based, Charge_By_Min
local mode = "RECREATION" -- Recreation, Overseer, Access_Term must be UPPERCASE
local skipTimeouts = false
local programmerAccessCode = 1234
if environmentType == "OpenComputers" then
    local component = require("component")
    local event = require("event")
    local modem = component.modem
end
local function programmerOpt()
    print("[Programmer Options]:")
    print([[
You've enabled Programmer Options.
Would you like to skip timeouts?
y/n
    ]])
    local optionYesOrNo = io.read()
    if optionYesOrNo == "y" then
        skipTimeouts = true
    elseif optionYesOrNo == "n" then
        skipTimeouts = false
    else
        print("Invalid choice. Defaulting to no skipping.")
        skipTimeouts = false
    end
end
if environmentType == "OpenComputers" then
    os.execute("clear")
else
    os.execute("cls")
end
print([[
Welcome to the Fox-Tek Terminal
If you are a developer of this system
When prompted please enter the programmer code
Otherwise, press ENTER to continue
Enter code now:
]])
local codeEntered = tonumber(io.read())
if codeEntered == programmerAccessCode then
    programmerOpt()
elseif codeEntered == "" then
    print("Terminal is continuing...")
    if environmentType == "OpenComputers" then
        os.execute("clear")
    else
        os.execute("cls")
    end
else
    if environmentType == "OpenComputers" then
        os.execute("clear")
    else
        os.execute("cls")
    end
end

-- Validate Previous Settings
local function validateEnvType()
    if environmentType ~= "Windows_NT" and environmentType ~= "OpenComputers" then
        print([[
            Hold Up! Sorry to interrupt this awesome fallout style terminal, but we need to know what device we're working with.
            Choose one:
            1. Open Computers
            2. Windows
        ]])

        local choice = io.read()
        print("Hold on, we're entering your choice " .. choice .. " into the system.")

        if choice == "1" or choice == "1." then
            environmentType = "OpenComputers"
            print("All set! We've successfully set Open Computers as the environmentType.")
        elseif choice == "2" or choice == "2." then
            environmentType = "Windows_NT"
            print("All set! We've successfully set Windows as the environmentType.")
        else
            print("Sorry, you chose: " .. choice .. " which seems to be invalid.")
        end
    end
end

-- Colors!!!
local reset = "\27[0m"        -- Reset to default color
local yellow = "\27[33m"      -- Yellow
local blue = "\27[34m"        -- Blue

-- Important Basic Functions
local function clearTerm()
    if environmentType == "Windows_NT" then
        os.execute("cls")
    elseif environmentType == "OpenComputers" then
        os.execute("clear")
    else
        print("Cannot clear terminal. Unknown environmentType.")
    end
end

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

-- looks messy with two functions being rewritten constantly so combine into 1
local function waitThenClear(seconds)
    wait(seconds)
    clearTerm()
end

local function printDebug(input)
    if debug then
        print(blue .. "[Service] (DEBUG): \n" .. input .. blue .. reset)
    end
end

local function getSystemSpecs()
    if environmentType == "Windows_NT" then
        local file = io.popen("systeminfo")
        local output = file:read("*a")
        file:close()

        local ram = output:match("Total Physical Memory: ([^\n]+)")
        local storage = output:match("Total Physical Disk Capacity: ([^\n]+)")

        if ram then
            print("RAM: " .. ram)
        else
            print("RAM information not found.")
        end

        if storage then
            print("Storage: " .. storage)
        else
            print("Storage information not found.")
        end
    elseif environmentType == "OpenComputers" then
        local computer = require("computer")
        print("RAM: " .. computer.totalMemory() .. " bytes")

        -- Skip storage retrieval since spaceTotal is not available
        print("Storage: N/A")
    else
        print("System specs retrieval not implemented for this environment type.")
    end
end

-- System Checkup
validateEnvType()
printDebug([[
Checks appear to have successfully completed, including:
    - Function validateEnvType, which checks the environmentType string.
]])
clearTerm()

print(yellow .. "Terminal is starting..." .. reset)
waitThenClear(5)
print(yellow .. [[
Main Terminal Script
Version 0.0.1c
REAL Copyright.
(c) 2024 CloudAPI.one API Caching Service

The following may contain FAKE or REAL copyrights, trademarks, company names, etc. All rights reserved to respective companies.
If you would like to have content REMOVED from this code, please email support@cloudapi.one.
]] .. reset)

waitThenClear(1)
wait(3)

print([[
   _____ _                 _          _____ _____                                 
  / ____| |               | |   /\   |  __ \_   _|                                
 | |    | | ___  _   _  __| |  /  \  | |__) || |                                  
 | |    | |/ _ \| | | |/ _` | / /\ \ |  ___/ | |                                  
 | |____| | (_) | |_| | (_| |/ ____ \| |    _| |_                                 
  \_____|_|\___/ \__,_|\__,_/_/    \_\_|   |_____|                                
  _     _    _           _______ ______ _____  __  __ _____ _   _          _      
 | |   | |  | |  /\     |__   __|  ____|  __ \|  \/  |_   _| \ | |   /\   | |     
 | |   | |  | | /  \       | |  | |__  | |__) | \  / | | | |  \| |  /  \  | |     
 | |   | |  | |/ /\ \      | |  |  __| |  _  /| |\/| | | | | . ` | / /\ \ | |     
 | |___| |__| / ____ \     | |  | |____| | \ \| |  | |_| |_| |\  |/ ____ \| |____ 
 |______\____/_/    \_\    |_|  |______|_|  \_\_|  |_|_____|_| \_/_/    \_\______|
                                                                                  

(c) 2024 CloudAPI.one API Caching Service
]])
waitThenClear(5)

print([[
 __      __         _ _       _______              
 \ \    / /        | | |     |__   __|             
  \ \  / /_ _ _   _| | |_ ______| | ___  ___       
   \ \/ / _` | | | | | __|______| |/ _ \/ __|      
    \  / (_| | |_| | | |_       | |  __/ (__       
  ___\/ \__,_|\__,_|_|\__|    _ |_|\___|\___|      
 |_   _|         | |         | |               
   | |  _ __   __| |_   _ ___| |_ _ __ _  ___  ___ 
   | | | '_ \ / _` | | | / __| __| '__| |/ _ \/ __|
  _| |_| | | | (_| | |_| \__ \ |_| |  | |  __/\__ \
 |_____|_| |_|\__,_|\__,_|___/\__|_|  |_|\___||___/
                                                   
This script makes use of the name "Vault-Tec", which is a registered trademark of Bethesda Softworks.
All rights reserved to respective owners. For removal of Vault-Tec name/branding email support@cloudapi.one
]])
waitThenClear(5)
print(yellow .. [[
(c) 2002 Fox-Tek Industries
Terminal Specs:
]].. reset)
getSystemSpecs()

-- Smaller Pieces
-- Chat Function
local function chat(type)
    if type == "recreation" then
        clearTerm()
        wait(5)
        dofile("recreationChat.lua")
    end
end

-- Recreation Main Function
local function recreationMain()
    if accessType == "FREE_USE" then
print(yellow .. [[
Recreation Terminal
[THIS TERMINAL IS FREE TO USE]
Misuse of this terminal is prohibited.
]].. reset)
        wait(3)
print([[
For Help, enter "help"
Please enter a vaild command:
]])
        local input = io.read()
        if input == "help" then
            print("Sorry. Coming Soon.")
            waitThenClear(5)
            recreationMain()
        elseif input == "talk" then
            print("[System]: Checking out your system please wait... ")
            if environmentType == "WINDOWS_NT" then
                print("[System]: Sorry, your system is incompatible")
                waitThenClear(5)
                recreationMain()
            else
                chat("recreation")
            end
        elseif input == "exit" then
            clearTerm()
            os.execute("lua main.lua")  -- Restart the main.lua script
        elseif input == "version" then
            clearTerm()
            print([[
Fox-Tec Terminal
Version 0.0.1c
Major Changes:
    - Software Lockdown
System Information:
            ]])
            getSystemSpecs()
            waitThenClear(5)
            recreationMain()
        else
            print("[System]: Sorry, we're fresh out of options.")
            waitThenClear(5)
            recreationMain()
        end
    end
end



-- Start the main function
recreationMain()
