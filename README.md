# WSL Kernel Updater
This shell script will update a WSL Instance to use the latest kernel release provided from https://github.com/nathanchance/WSL2-Linux-Kernel.

In order to use this script, you must do the following:
- Create a folder to hold version information and the kernel image (For example, I have mine in C:\Users\Username\Linux)
- Create the .wslconfig file in your Windows home directory (C:\Users\Username\\.wslconfig)
- Add the following to the .wslconfig:
```
[wsl2]
kernel=<Path to your folder from above>\\bzImage
```
- Edit the script to reflect the path from above in the $PACKAGE_DIR variable
- Run the script from within WSL and enjoy
