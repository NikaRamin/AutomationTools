import os
import shutil
import time
from datetime import datetime

# Paths 
SOURCE_FOLDER = os.path.expanduser("~/Desktop")  # Adjust based on your OS
DEST_FOLDER = os.path.expanduser("~/Pictures/Screenshots")

# Ensure destination folder exists
os.makedirs(DEST_FOLDER, exist_ok=True)

# Function to check and move screenshots
def organize_screenshots():
    for file in os.listdir(SOURCE_FOLDER):
        if file.startswith("Screenshot") and file.endswith(".png"):  # Adjust based on your OS
            src_path = os.path.join(SOURCE_FOLDER, file)
            timestamp = datetime.now().strftime("%Y-%m-%d_%H-%M-%S")
            new_filename = f"screenshot_{timestamp}.png"
            dest_path = os.path.join(DEST_FOLDER, new_filename)
            try:
                shutil.move(src_path, dest_path)
                print(f"Moved: {file} → {new_filename}")
            except Exception as e:
                print(f"Failed to move {file}: {e}")

def main():
    organize_screenshots()

if __name__ == "__main__":
    main()
