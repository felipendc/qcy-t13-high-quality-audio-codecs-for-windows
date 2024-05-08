import glob
import os

# Author: Felipe Ndc (VicyosLife)
# Using python-3.12.2


# Use glob.glob() to find files that match the pattern "_vicyos_backup" and delete them.
matching_files = glob.glob('C:\\Windows\\System32\\**\\*_vicyos_backup*', recursive=True)

# Print the list of files found
for file in matching_files:
    os.remove(file)