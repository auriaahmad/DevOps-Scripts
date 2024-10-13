
# Request to Follow and Star the Repository. Thanks :)
# Step-by-Step Execution Instructions

### What the Script Does:

- **Specify Log Directory**: Allows the user to select which log directory to archive.
- **Days to Keep Logs**: Allows the user to specify how long logs should be retained before archiving.
- **Days to Keep Backup Archives**: Specifies how long archived backups should be kept before they are deleted.
- **Run Archiving**: Compresses and archives logs older than the specified days, logs the process, deletes the old logs, and cleans up old backups.
- **Cron Setup**: Optionally adds the script to run daily at a specified time via `cron`.

This tool provides a simple way to manage log files and their backups interactively from the command line.

1. **Save the Script:**
   - Open your terminal.
   - Use `nano` or another editor to create the file in `/usr/local/bin/`.
   - Run the following command to open the file:
     ```bash
     sudo nano /usr/local/bin/log-archive.sh
     ```

2. **Paste the Script:**
   - Paste the above script into the `nano` editor.

3. **Save and Exit `nano`:**
   - Press `Ctrl + O` to save the file, then hit `Enter`.
   - Press `Ctrl + X` to exit `nano`.

4. **Make the Script Executable:**
   - Make the script executable with the following command:
     ```bash
     sudo chmod +x /usr/local/bin/log-archive.sh
     ```

5. **Run the Script:**
   - To run the script interactively, use:
     ```bash
     /usr/local/bin/log-archive.sh
     ```

6. **Setup Cron Job (Optional):**
   - During execution, you'll be prompted to add the script to `cron` for daily execution at 2:00 AM. If you choose `yes`, a cron job will be added automatically.
   - To view or edit cron jobs, run:
     ```bash
     crontab -e
     ```

7. **Stopping the Cron Job:**
   - To remove the cron job, open the cron job editor:
     ```bash
     crontab -e
     ```
   - Remove the line that contains `/usr/local/bin/log-archive.sh` and save.