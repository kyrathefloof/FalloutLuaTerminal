local environmentType = os.getenv("OS") or "OpenComputers"
-- Utils
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

clearTerm()
local function startChoice()
    print([[
Fox-Tek Industries
ABOUT SYSTEM

Choice:
1. Techincal Specs
2. General Info
>> Input either a 1 or 2 <<
]])

    local choice = io.read()
    if choice == "" then
        print([[
Fox-Tek Terminal Version 0.1.0A (A1000A)

== ABOUT ==
> TECHINCAL/OVERVIEW

Version Information:
Release ID (A1000A) means:
First "A" -> Developer Preview
"1" -> Operating System, "2" Stand-alone
"000"-"999" -> 0 - 999 different versions before next version.
Second "A" -> Denotes a turn-over of the 999 possible combinations. So, A1999A becomes A1000B, or, A1999Z becomes A1999ZA
        ]])
        waitThenClear(5)
        print([[
Fox-Tek Terminal Version 0.1.0A (A1000A)

== ABOUT ==
> TECHINCAL/OVERVIEW
>> pg. 2

Running Lua 5.2
Running on an OpenOS based Operating System comprised in LUA.
Intended to be ran inside Minecraft Java Edition with FML 1.12.2 and OpenComputers installed.
        ]])
        waitThenClear(5)
        print(">> YOU WILL NOW BE REDIRECTED BACK TO THE TERMINAL <<")
        waitThenClear(2)
        dofile("/home/fallout_terminal_core/main/main.lua")
    elseif choice == "2" then
        print([[
Fox-Tek Terminal Version 0.1.0A (A1000A)
== ABOUT | OPT 2 ==

This code was written by Kyra Young, 
based on OpenOS written by various contributors for the Minecraft Mod "OpenComputers"
        ]])
        waitThenClear(5)
        print([[
Fox-Tek Terminal Version 0.1.0A (A1000A)
== ABOUT | OPT 2 == 
>> PAGE 2 <<

The goal of this code is to replicate what the real Fallout terminals feel, interact and work like
Without ripping off their design entirely.
This is a Developer Preview, not intended for the general
public as bugs or other issues need to be worked out

Features are limited but will be added along with different logs and *hopefully*
adding the ability to open doors and whatnot.
        ]])
        waitThenClear(5)
        print(">> YOU WILL NOW BE REDIRECTED BACK TO THE TERMINAL <<")
        waitThenClear(2)
        dofile("/home/fallout_terminal_core/main/main.lua")
    else
        clearTerm()
        print("Working")
        for i=1,5 do
            io.write(".")
        end
        io.write("\n")
        waitThenClear("2")
        print([[
Fox-Tek Terminal Version 0.1.0A (A1000A)
== ABOUT ==

Invaild choice or an unexpected error occured. 
>> Resetting <<
        ]])
        wait(5)
        startChoice()
    end
end

startChoice()