# AmuletMC Install Script
This is an Install Script For Amulet MC Python Version. This script currently works on Linux (and with Windows Subsystem for Linux On Windows 11).

# HOW TO RUN PROGRAM

1. Download The AmuletMCInstallScript.sh file to ideally a seperate folder since the python virtual environment will make a subfolder to where the script is ran from.

2. After The Download make sure the shell script is executable with this command: sudo chmod +x AmuletMCInstallScript.sh

   Tip: You can also do it with a file explorer on Linux as well here is an example with Dolphin File Explorer on Bazzite
    <img width="519" height="607" alt="Screenshot_20260705_154926" src="https://github.com/user-attachments/assets/152f6b2a-7793-49cb-a3e0-011fae8acd4e" />

3. Now run the shell script perferably in a terminal instead of by itself so you can see what it outputs.

Example:
    
<img width="770" height="668" alt="Screenshot_20260705_155252" src="https://github.com/user-attachments/assets/53f9bc37-e829-48a5-a63e-99b6bb776bfd" />

4. To Run The Program Afterwards always run: uv run amulet_map_editor

5. To Update The Program you will need to run this specific commands everytime:

export CXXFLAGS+=" -Wno-error=maybe-uninitialized"
uv pip install --upgrade amulet-map-editor --verbose

Credit goes to the AmuletMC Developers for keeping this option free
https://www.amuletmc.com/
