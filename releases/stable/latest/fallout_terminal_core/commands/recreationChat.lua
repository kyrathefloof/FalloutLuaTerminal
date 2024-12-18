local component = require("component")
local event = require("event")
local m = component.modem
local term = require("term")
local environmentType = os.getenv("OS") or "OpenComputers"

-- Initialization
local function wait(seconds)
    if environmentType == "Windows_NT" then
        os.execute("timeout " .. seconds.. " >nul")
    elseif environmentType == "OpenComputers" then
        os.execute("sleep ".. seconds)
    else
        print("Wait function not implemented for this environment type.")
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

print([[
Recreation Terminal Chat
(c) 2024 CloudAPI.one API Caching Service
Version 0.0.1c
]])
wait(1)
clearTerm()
print([[
Known Issues at this time: 
Newer messages appear before older messages. Intended for now.

Find issues? Contact an overseer
Just kidding
Email me at support@cloudapi.one

THE FOLLOWING MAY CONTAIN REAL OR FAKE COMPANIES, TRADE MARKS, COPYRIGHTS. 
ALL RIGHTS RESERVED TO THEIR RESPECTIVE OWNERS.
ANY COPYRIGHTED MATERIAL IN THIS CODE NEEDS TO BE IMMEADIATELY REPORTED
TO THE EMAIL ABOVE. (pls dont sue me im just a lil guy)
]])
wait(5)
clearTerm()
print([[
(c) 2002 Fox-Tek Industries
[USE OF THIS TERMINAL IS A PRIVILEDGE NOT A RIGHT]
(Real Talk): This chat system is my work. To my knowledge, I did not copy or use anyone elses work.
Theft of this code will NOT be taken lightly. I do not want to sue anyone but I sure as hell will
Be a good person please :)
]])
wait(3)
clearTerm()
print([[
We're starting chat system 0.0.1c now. Please be patient this may take some time.
]])
wait(2)
clearTerm()
print("Now starting...")
wait(5)
clearTerm()
-- Open the modem on the specified port
local port = 12345
m.open(port)
print("Modem open on port " .. port)

-- Table to store already received messages (circular buffer)
local maxMessages = 16
local receivedMessages = {}
local currentMessageIndex = 1

-- Function to add a message to the circular buffer
local function addMessage(from, message)
    receivedMessages[currentMessageIndex] = { from = from, message = message }
    currentMessageIndex = currentMessageIndex % maxMessages + 1
end

-- Function to check if a message is new
local function isNewMessage(from, message)
    for i = 1, maxMessages - 1 do
        local index = (currentMessageIndex - i) % maxMessages + 1
        local msg = receivedMessages[index]
        if msg and msg.from == from and msg.message == message then
            return false
        end
    end
    return true
end

-- Function to display the recent history of messages in reverse order
local function displayMessages()
    term.clear()
    
    -- Start index at the current message index minus 1
    local startIndex = currentMessageIndex - 1
    
    -- Iterate over the messages in reverse order
    for i = 0, maxMessages - 1 do
        local index = (startIndex - i) % maxMessages + 1
        local msg = receivedMessages[index]
        if msg then
            print("Received message from " .. msg.from .. ": " .. msg.message)
        end
    end
end


-- Function to handle receiving messages
local function handleMessages()
    while true do
        -- Receive messages
 
        local _, _, _, from, _, receivedMessage = event.pull(0.1, "modem_message")
        if from and receivedMessage and isNewMessage(from, receivedMessage) then
            print('\n')
            addMessage(from, receivedMessage)
            displayMessages()
            -- Rebroadcast the message
            m.broadcast(port, receivedMessage)
        end
    end
end


-- Function to read user input and send messages
local function readInput()
    while true do
        displayMessages()
        print("\nEnter your message: ")
        local message = io.read()
        if message then
            if message == "exit" then
                clearTerm()
                io.write("Are you sure y/n: ")
                local decision = io.read()
                if decision == "y" then
                    clearTerm()
                    io.write("Sending you back...")
                    wait(5)
                    clearTerm()
                    dofile("/home/fallout_terminal_core/main/main.lua")
                    break  -- Exit the while loop
                elseif decision == "n" then
                    clearTerm()
                    -- Continue the loop to ask for input again
                else
                    print("Invalid input. Please enter 'y' or 'n'.")
                end
            else
                m.broadcast(port, message)
                print("Message sent: " .. message)
            end
        end
    end
end




-- Start a parallel execution for handling messages and reading input
local function main()
    local messageHandler = function()
        handleMessages()
    end

    local inputHandler = function()
        readInput()
    end

    -- Run both functions in parallel
    local threads = require("thread")
    local messageThread = threads.create(messageHandler)
    local inputThread = threads.create(inputHandler)

    messageThread:detach()
    inputThread:detach()

    while true do
        os.sleep(1)
    end
end

main()