
# Backup Script

## Overview
This is a simple Bash script that creates a `.tar` archive of a given directory and moves it to a backup location (`$HOME/backup`). If no directory is specified, the script backs up the current working directory.

## Features
✅ Automatically detects the input directory (defaults to the current directory if not provided).  
✅ Creates an archive (`archive.tar`) of the input directory.  
✅ Ensures the backup directory exists (`$HOME/backup`).  
✅ Prevents backing up the backup directory itself.  
✅ Checks if required commands (`tar`, `mv`, `mkdir`) are installed before running.  
✅ Handles existing archive conflicts by overwriting the previous backup.  

## Usage
### **Run the script with a specific directory:**
```bash
./backup.sh /path/to/directory
```

### **Run the script without arguments (backs up the current directory):**
```bash
./backup.sh
```

## Installation
1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/backup-script.git
   ```
2. Navigate into the directory:
   ```bash
   cd backup-script
   ```
3. Make the script executable:
   ```bash
   chmod +x backup.sh
   ```
4. Run the script as described in the **Usage** section.

## Automating Execution
To automate the execution of this script, you can use `cron` on Linux/macOS or Task Scheduler on Windows.

### **Using cron (Linux/macOS)**
1. Open the crontab editor:
   ```bash
   crontab -e
   ```
2. Add a line to schedule the script (e.g., run daily at midnight):
   ```bash
   0 0 * * * /path/to/backup.sh >> /path/to/backup.log 2>&1
   ```
3. Save and exit. The script will now run automatically at the specified time.

### **Using Task Scheduler (Windows)**
1. Open Task Scheduler and create a new task.
2. Set the trigger to run at a specific interval (e.g., daily at midnight).
3. Set the action to run `bash.exe` with the full path to `backup.sh` as an argument.
4. Save the task, and it will run automatically.

## Notes
- Ensure you have `tar`, `mv`, and `mkdir` installed. The script checks for their existence before execution.  
- The archive is always named `archive.tar` and will be **overwritten** if it already exists in the backup directory.  
- If the input directory does not exist, the script will exit with an error.  

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

