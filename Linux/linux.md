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


    
