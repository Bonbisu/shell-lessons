import os
import platform

sys = platform.system()
pip = os.system('which pip2')

print('Installing dependencies, please make sure you have a root access!')
raw_input("Press Enter to continue...")

if sys == 'Linux':
    if pip == 256:
        print('The package manager "pip" was not found. Installing pip...')
        os.system('sudo apt install python-pip python3-pip')

os.system('pip2 install requests')
print('All dependencies was successfully installed!')
