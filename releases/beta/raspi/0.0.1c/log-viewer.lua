local environmentType = "raspbian"
local debug = false
local accessType = "FREE_USE" -- Free_Use, Login_Based, Charge_By_Min
local mode = "RECREATION" -- Recreation, Overseer, Access_Term must be UPPERCASE
local skipTimeouts = false
local programmerAccessCode = 1234


-- Utils
local function clearTerm()
    if environmentType == "Windows_NT" then
        os.execute("cls")
    elseif environmentType == "raspbian" then
        os.execute("clear")
    else
        print("Cannot clear terminal. Unknown environmentType.")
    end
end

local function wait(seconds)
    if not skipTimeouts then
        if environmentType == "Windows_NT" then
            os.execute("timeout " .. seconds .. " >nul")
        elseif environmentType == "raspbian" then
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

-- END UTILS


print([[]])


















