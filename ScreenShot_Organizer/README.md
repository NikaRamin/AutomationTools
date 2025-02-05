# ScreenShot Organizer

ScreenShot Organizer is a simple Python script designed to automatically organize and move your screenshots from your desktop to a designated folder. This can be especially useful for keeping your desktop clean and your screenshots well-organized.

## Features

- **Automatic Organization**: Moves screenshots from your desktop to the specified folder.
- **Timestamp Naming**: Renames screenshots with a timestamp to avoid filename conflicts.
- **Cross-Platform**: Works on any OS with Python installed.

## Installation

### Prerequisites

- Python 3.6 or higher

### Steps

1. Clone the repository:

    ```bash
    git clone https://github.com/YourUsername/ScreenShot_Organizer.git
    cd ScreenShot_Organizer
    ```

2. Run the script:

    ```bash
    python screenshot_organizer.py
    ```

## Configuration

### For Unix-based Systems (Linux/Mac)

By default, the script moves screenshots from the `~/Desktop` folder to the `~/Pictures/Screenshots` folder. You can adjust these paths by modifying the `SOURCE_FOLDER` and `DEST_FOLDER` variables in the script:

```
SOURCE_FOLDER = os.path.expanduser("~/Desktop")
DEST_FOLDER = os.path.expanduser("~/Pictures/Screenshots")
```
### For Windows Users
By default, Windows has the Pictures folder inside the C:\Users\YourUsername\ directory. If you want to organize your screenshots there, modify the script like this:

```python
SOURCE_FOLDER = os.path.expanduser(r"C:\Users\YourUsername\Desktop")
DEST_FOLDER = os.path.expanduser(r"C:\Users\YourUsername\Pictures\Screenshots")
```
Make sure to replace YourUsername with your actual Windows username. You can also choose a different folder for organization by updating the DEST_FOLDER path accordingly.
## Scheduling the Script

### For Unix-based Systems (Linux/Mac)

To run this script automatically at regular intervals, you can schedule it using cron.

- Open your crontab file:

```bash
crontab -e
```
- Add the following line to schedule the script to run every hour:

```bash
0 * * * * /usr/bin/python3 /path/to/your/ScreenShot_Organizer/screenshot_organizer.py
```
- Replace /usr/bin/python3 with the path to your Python interpreter and /path/to/your/ScreenShot_Organizer/screenshot_organizer.py with the path to the script.
- You can discover the path to your Python interpreter by :
```bash
which python3
```

- Save and exit the crontab editor.

### For Windows Users
To run the script at regular intervals on Windows, you can use Task Scheduler:

1. Open Task Scheduler by typing "Task Scheduler" into the start menu.
2. Click Create Basic Task on the right-hand side.
3. Follow the wizard to set the task name, trigger (e.g., daily, or every hour), and action (run the Python script).
4. In the "Action" step, choose Start a program, then browse to your Python executable (python.exe).
5. Add the script's full path (screenshot_organizer.py) as the argument in the "Add arguments" field.
6. Finish the setup, and the task will run at the specified interval.
