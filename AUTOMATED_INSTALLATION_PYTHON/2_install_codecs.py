import os
import shutil

# Author: Felipe Ndc (VicyosLife)
# Install the best QCY-T13 audio codecs for Windows!



# ################### DECLARING VARIABLES ######################
# Get the Windows installation directory from the environment variable
windows_dir = os.environ.get('SYSTEMROOT', 'C:\\Windows')

# Construct the System32 directory path
system32_dir = os.path.join(windows_dir, 'System32')

# Get the current user name
username = os.getlogin()

# Get the absolute path to the currently executing script
script_path = os.path.abspath(__file__)

# Get the directory containing the script
script_dir = os.path.dirname(script_path)

# Join current folder with the codecs_to_be_installed.txt
codecs_to_be_installed_path = os.path.join(script_dir, 'files', 'codecs_to_be_installed.txt')

# Join current folder with the codecs_to_be_installed.txt
codecs_to_be_removed_path = os.path.join(script_dir, 'files', 'codecs_to_be_removed.txt')

# Join current folder with the mixer_files_and_folders_directories.txt
mixer_files_and_folders_to_be_removed_path = os.path.join(script_dir, 'files', 'mixer_files_and_folders_directories.txt')
# ################# DECLARING VARIABLES END ####################





# #################  CODE LOGIC  ####################

# Defining a global variable.
name_counter = 0

# Check if "mixer_files_and_folders_directories.txt" exists in the files folder and renaming mixer files.
if os.path.exists(mixer_files_and_folders_to_be_removed_path):
    with open(mixer_files_and_folders_to_be_removed_path, 'r') as arquivo:
        for file in arquivo:
            if os.path.exists(file):
                name_counter += 1
                try:
                    renaming_mixer_files = f'{file.strip()}_vicyos_backup_{name_counter}'
                    renaming_mixer_files_to_string = str(renaming_mixer_files)
                    new_name = os.path.join(system32_dir, renaming_mixer_files_to_string)
                    os.rename(file.strip(), new_name)
                except OSError as error:
                    print(f"Error: {error}")
            else:
                print(f"The file {file.strip()} does not exist.")

    try:
        # Using os.remove() to delete the file "mixer_files_and_folders_directories.txt" in the files folder.
        os.remove(mixer_files_and_folders_to_be_removed_path)
        print(f"The file {mixer_files_and_folders_to_be_removed_path} has been deleted successfully.")
    except FileNotFoundError:
        print("File not found!.")
    except PermissionError:
        print("You don't have permission to delete this file.")
    except Exception as e:
        print(f"Error to delete the file: {e}")
else:
    print(f"The file {mixer_files_and_folders_to_be_removed_path.strip()} does not exist.")



# Renaming current codecs related files.
with open(codecs_to_be_installed_path, 'r') as arquivo:
    for file in arquivo:
        codecs_in_system_32 = os.path.join(system32_dir, file.strip())
        if os.path.exists(codecs_in_system_32):
            name_counter += 1
            try:
                renaming_files = f'{file.strip()}_vicyos_backup_{name_counter}'
                renaming_files_to_string = str(renaming_files)
                new_name = os.path.join(system32_dir, renaming_files_to_string)
                os.rename(codecs_in_system_32, new_name)
            except OSError as error:
                print(f"Error: {error}")
        else:
            print(f"The file {codecs_in_system_32} does not exist.")



# Renaming current codecs related files. 
with open(codecs_to_be_removed_path, 'r') as arquivo:
    for file in arquivo:
        codecs_in_system_32 = os.path.join(system32_dir, file.strip())
        if os.path.exists(codecs_in_system_32):
            name_counter += 1
            try:
                renaming_files = f'{file.strip()}_vicyos_backup_{name_counter}'
                renaming_files_to_string = str(renaming_files)
                new_name = os.path.join(system32_dir, renaming_files_to_string)
                os.rename(codecs_in_system_32, new_name)
            except OSError as error:
                print(f"Error: {error}")
        else:
            print(f"The file {codecs_in_system_32} does not exist.")



# Copying codecs related files to System32 folder.
with open(codecs_to_be_installed_path, 'r') as arquivo:
    for file in arquivo:
        codec_files_to_be_moved = os.path.join(script_dir, 'best_audio_codecs_for_windows_11', file.strip())
        codec_files_to_be_moved_to_string = str(codec_files_to_be_moved)
        move_codecs_to_system32 = os.path.join(system32_dir, file.strip())
        move_codecs_to_system32_to_string = str(move_codecs_to_system32)
        if os.path.exists(codec_files_to_be_moved_to_string):
            try:
                shutil.copy(codec_files_to_be_moved_to_string, move_codecs_to_system32_to_string)
            except OSError as error:
                print(f"Error: {error}")
        else:
            print(f"The file {codec_files_to_be_moved_to_string} does not exist.")
