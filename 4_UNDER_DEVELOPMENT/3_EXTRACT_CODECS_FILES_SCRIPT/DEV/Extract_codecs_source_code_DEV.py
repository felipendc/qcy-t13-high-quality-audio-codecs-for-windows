import os
import shutil
import glob

# Author: Felipe Ndc (VicyosLife)
# Using python-3.12.2

# ################### DECLARING VARIABLES ######################
# Get the Windows installation directory from the environment variable
windows_dir = os.environ.get("SYSTEMROOT", "C:\\Windows")

# Construct the System32 directory path
system32_dir = os.path.join(windows_dir, "System32")

# Get the absolute path to the currently executing script
script_path = os.path.abspath(__file__)

# Get the directory containing the script
script_dir = os.path.dirname(script_path)

# Join current folder with the codecs_to_be_installed.txt
codecs_to_be_installed_path = os.path.join(script_dir, "codec_and_decode_files_DEV.txt")
# ################# DECLARING VARIABLES END ####################

# Check if the folder "extracted_files" exist, if it does, back it up.
increment = 0
extracted_files_folder = os.path.join(script_dir, "*extracted_files*")
matching_files = glob.glob(extracted_files_folder)
current_folder = os.path.join(script_dir, "extracted_files")
if os.path.exists(current_folder):
    for file in matching_files:
            increment += 1
    os.rename(current_folder, os.path.join(script_dir, f"{current_folder}_vicyos_backup_{increment}"))

# Creating folders.
folder_path = os.path.join(script_dir, "extracted_files", "migwiz", "replacementmanifests")
os.makedirs(folder_path)

# Copying codecs related files from System32 folder and subfolders.
with open(codecs_to_be_installed_path, "r") as arquivo:
    for file in arquivo:
        codec_files_to_be_moved = os.path.join(system32_dir, file.strip())
        move_codecs_to_extracted_files = os.path.join(script_dir, "extracted_files", file.strip())
        if os.path.exists(codec_files_to_be_moved):
            try:
                shutil.copy(codec_files_to_be_moved, move_codecs_to_extracted_files)
            except OSError as error:
                print(f"Error: {error}")
        else:
            print(f"The file {codec_files_to_be_moved} does not exist.")

file_in_extracted_folder = os.path.join(script_dir, "extracted_files", "msmpeg2vdec-migration-replacement.man")
move_file_to_folder_path = os.path.join(script_dir, "extracted_files", "migwiz", "replacementmanifests", "msmpeg2vdec-migration-replacement.man")
shutil.copy(file_in_extracted_folder, move_file_to_folder_path)