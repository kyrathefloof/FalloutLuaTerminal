# Latest Version (V1)

This may be the last release of this terminal depending on its popularity. 
The code in its current form is functional and works great but has limited options and (currently) no logs (a big aspect of the terminals in-game)

Please STAR this repo to let me know you are interested in further development

## Notes:
include the .shrc file to run the main script upon startup. 
[WARNING]: INCLUDING THE .shrc SCRIPT WILL PREVENT YOU FROM USING YOUR COMPUTER, I ADVISE YOU TO INSTALL THE "FULLY LOCKED DOWN" Operating System version, which allows you to leave (read more below)

[RETURN TO SHELL]:
In order to return to shell, you need to access the log section of the internals.
Follow the steps below:
Upon script start, it'll say
"(c) 2002 Fox-Tek Industries
Terminal Specs:
{SOME VALUE}
{SOME VALUE}
For Help, enter "help"
Please enter a vaild command:
"
[NOTICE]: "help" has been written, but in this version i havent included it because it's buggy. Future versions will have it.
The commands are:
"version", "talk", "admin"

Talk allows you to talk to nearby machines with a Wireless Network Card (Tier 2 was used for testing and programming)
and even talk with a linked card 

Version displays version info

ADMIN -> the one you want
Default Code is 0511
(You can change it, but you have to edit every single file)

after ADMIN, type "logs" and click enter
once logs finish you should be kicked into the shell. 
from there, if you used the FLD-OS, you'll need to enter 0511 for every single action (sorry!)

[RESTORE AFTER LOCKDOWN]:

IF you messed up going into the ADMIN controls, you'll be forced to lockdown which auto writes to the .shrc file and prevents you from restarting into the terminal.

Resolution Methods:
**#1 BUG:** this is a bug that i plan to fix later, but for now: when you see the "Console Locked, anti-tampering lock" message, you have 5 seconds to power cycle the system and prevent the overwrite of .shrc. 
I'LL STRESS THIS ONE LAST TIME: THIS IS A BUG!; do not expect this to stay in later versions (if any) as of version 1.0.0 (and older) this exists.

**#2 RECOMMENDED:**
Once in the lockdown menu you'll see
"FID: A2000G"

enter "admin" and press enter, you'll then be asked for the admin code *0511*
after that, you'll see a "log" of what happened, and be kicked to the shell.
you are NOT in the clear yet.
now you need enter the following command based on where you get kicked to (should be /home)
use: ./fallout-terminal-core/utils/restore.lua
You'll be prompted to provide an access code *0511* and then it'll write the .shrc file and *attempt* to restart the "Computer"
if it fails -> manually power cycle the machine.

**[DO NOT]:**
rename any files, folders, or edit the contents of the files. The code is written to assume you are in the right environment and have the proper files. 
The slightest change may corrupt your "Computer", your world, your (in a very rare case) your actual computer. PLEASE DO NOT make ANY changes.
