## Overview

This batch script, authored by Jeff Steveanus, organizes files in the current directory into subfolders based on their type, year, and month of creation. It is designed to help users manage and categorize their files efficiently.

## Author

- **Name:** Jeff Steveanus
- **Social Media:** @jeffsteveanus (Facebook, Instagram, Threads, LinkedIn, TikTok)

## Details

- **Date:** 2025-01-30
- **Version:** 1.0
- **Tested on:** Windows 10

## Description

This batch file will organize files in the current folder into subfolders based on their type, year, and month of creation.

## Usage

1. Place this batch file in the folder containing the files you want to organize.
2. Run the batch file.

## Notes

- This script has only been tested on Windows 10.

## Script Explanation

The script performs the following steps:

1. **Initialization:**
   - Defines categories of files (Compressed, Videos, Musics, Pictures, Documents) and their associated file extensions.
   - Sets the source directory to the current directory.
   - Defines month names for converting month numbers to names.

2. **File Processing:**
   - Loops through all files in the source directory.
   - For each file, checks its extension against the defined categories.
   - Retrieves the file's creation date and extracts the year and month.
   - Converts the month number to the corresponding month name.
   - Creates a target directory based on the file type, year, and month if it does not already exist.
   - Moves the file to the target directory and displays a message indicating the file has been moved.

3. **Completion:**
   - Displays a message indicating that files have been successfully organized.
   - Prompts the user to press any key to exit.

## Example

To use this script, simply place it in the directory with your files and run it. The files will be organized into subfolders like this:

```
Compressed/
  2025/
    January/
      file1.zip
      file2.rar
Videos/
  2025/
    February/
      video1.mp4
      video2.avi
...
```

## Contact

For any questions or support, please contact Jeff Steveanus on social media @jeffsteveanus.
