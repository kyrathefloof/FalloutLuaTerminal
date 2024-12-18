local filepath = "/home/fallout_terminal_core/log.txt"
    
        -- Open the file in read mode
        local file = io.open(filepath, "r")
        if not file then
            error("Unable to open file for reading")
        end
        
        -- Read the contents of the file
        local content = file:read("*all")
        file:close()
        
        -- Display the contents
        print(content)
        
        -- Open the file in write mode to wipe its contents
        file = io.open(filepath, "w")
        if not file then
            error("Unable to open file for writing")
        end

print("END OF FILE")
io.write(" --- RESTARTING IN 5 SECONDS meowwww-")
os.sleep(5)
os.shutdown() -- this should send them back to wherever they were.