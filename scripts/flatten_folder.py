import os
from shutil import copy2
to_directory

for subdir, dirs, files in os.walk(os.getcwd()):
    for file in files:
    	print(dirs)
    	print(file)