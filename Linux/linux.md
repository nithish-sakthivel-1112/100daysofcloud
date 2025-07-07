# Linux Operating System
Linux is another kind of Operating system which does the same thing as other operating system,it manages software and hardware resources. Linux is more reliable,secure and it is a open source. Most widely used OS in industry for server hosting, software development and etc

## File structure in Linux
Linux uses th logical filesystem,At the very top of the filesystem structure is /, often referred to as the root of the filesystem, as if it were an upside-down tree

![Linux Filesystem](linux-fs.png)

| Filesystem      | Description                                                                 |
|------------------|-----------------------------------------------------------------------------|
| `bin`           | Executables that are required to run OS                                     |
| `root`          | Home directory for the root user                                             |
| `boot`          | Bootloader files to boot Linux                                               |
| `dev`           | Devices that send/receive data sequentially (printers/mice); block devices (HDs, flash drives) |
| `etc`           | Text-based config files used by the system                                   |
| `home`          | Home folders for users; each user has their own home folder                 |
| `lib` → `usr/lib` | Code libraries for the programs in `bin` or `sbin`                         |
| `mnt`           | Used to mount external devices                                               |
| `opt`           | Contains files for programs installed manually                              |
| `sbin`          | Management and configuration tools                                           |
| `srv`           | Contains service data (e.g., files used by `httpd`)                          |
| `sys`           | Interface to hardware and system devices                                     |
| `tmp`           | Temporary files used by applications and the system                         |
| `usr`           | Contains user-installed applications and their files                         |
| `var`           | Variable data like logs, spool files, and caches                            |


## Package Management

Package management in linux is using repo manager from where you can install/upgrade applications or services. Each linux distrbution has it own repo manager for eg: Redhat family has `yum`and `rpm`. Debian distributions has `apt` and `dpkg`

### Yum
YUM repos are located in `/etc/yum.repos.d/`. 

| command | purpose |
| --- | --- |
| `yum update` | updates the repos and gives you the option of updating the packages pending updates |
| `yum search httpd` | searches for that package |
| `yum install $package` | to install it |
| `yum check-update $package` | to see if a package needs any updates |
| `yum upgrade` | upgrade package |
| `yum deplist $package` | check package’s list of dependencies |
| `yum clean packages` | will remove dependencies that were left behind but are no longer needed |
| `yum remove $package` | removes the package |
| `yum list installed` | list all installed packages |

### RPM
| command | purpose |
| --- | --- |
| `rpm -ipv package.rpm` | `i` means install, `p` means show progress, and `v` means verbose |
| `rpm -q nano` | query the package for info (true file name) |
| `rpm -qi nano` | query the package for more info |
| `rpm -e nano` | uninstall the package |
| `rpm -qR nano` | uninstall required packages |

## <span id="debian"></span>Debian based: APT and dpkg

### APT
Uses a sources list located in `etc/apt/sources.list`

| command | purpose |
| --- | --- |
| `apt-get update` | searches the online repos and caches the list of packages for when we do a search via... |
| `apt-cache search $package` | searches for a package in the APT cache |
| `apt-get install nginx` | install package |
| `apt-get remove nginx` | remove package |
| `apt-get remove --purge nginx` | to get rid of config files and such |
| `apt-get autoremove [$package]` | to remove unneeded packages. |
| `apt-get upgrade` | upgrades packages |
| `apt-get -f upgrade` | Imstalls dependencies that we’re flagged while attempting to install a Debian package |
| `apt-get dist-upgrade` | upgrades the kernel and distribution packages |

### dpkg

| command | purpose |
| --- | --- |
| `dpkg -i name.deb` | Installs Debian package |
| `dpkg --get-selections` | shows all installed packages |
| `dpkg --remove $package_name` | Removes Debian package |
| `dpkg --purge $package_name` | Removes dependencies |


### Basic Linux commands 

| command | purpose |
| --- | --- |
| `cp` | To copy the file |
| `mv` | To move or rename the file |
| `cd` | Change the directory |
| `ls` | List the items in the directory |
| `pwd` | present working directory |
| `sudo` | Execute the commands with super user privliges. |
| `rmdir` | To remove the empty directory |
| `rm -rf` | To remove the file recursively |
| `mkdir` | To create a new directory |

### Process management in linux

Process is the running instance of the program

| command | purpose |
| --- | --- |
| `ps aux` | To list all the running process |
| `ps -ef` | Detailed definition of the running process |
| `top` | Real time view of system process |
| `pgrep <process name>` | To find a specific process without knowing its PID |
| `kill` | To terminate the process |
| `pkill` | To terminate the process using the process name |
| `killall` | To terminate the all process using the process name |
| `nice` | Start a process with higher priority |
| `renice` | Change the priority of the running process |
| `sudo iotop` | To see the real time I/O proceses |




