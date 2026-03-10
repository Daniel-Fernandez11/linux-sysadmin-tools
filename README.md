# Linux SysAdmin Tools

Linux SysAdmin Tools is a small collection of command-line utilities designed to help with common Linux system administration tasks.

This repository provides an installer that makes several custom Bash tools available globally on the system.

Once installed, the tools can be executed from any directory.

# Included Tools

The toolkit currently includes the following utilities:

- disk-usage-check
  Checks if a directory exceeds a specified size limit.

- nightly-backup
  Performs automated backups designed to be scheduled with cron.

- logrotate-check
  Detects oversized log files and verifies logrotate configuration.

- service-watch
  Monitors systemd services and logs failures if a service stops.

# Installation

Clone the repository:

git clone https://github.com/Daniel-Fernandez11/linux-sysadmin-tools.git

Enter the directory:

cd linux-sysadmin-tools

Run the installer:

./install.sh

The tools will be installed in:

~/.local/bin

Make sure this directory is included in your PATH.

# Uninstall

To remove all installed tools:

./uninstall.sh

# Requirements

Linux system, Bash, Standard GNU utilities.

# Author

Jose Daniel Fernandez - GitHub: https://github.com/Daniel-Fernandez11
