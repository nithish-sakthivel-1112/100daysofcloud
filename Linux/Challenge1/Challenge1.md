# User Lifecycle management
 - Create a user
 - Add the User to the group 
 - Setting password policies
 - Automating the process

 # Commands used to do 

 - `sudo usermod <username>` -> Creates the user
 - `sudo passwd <username>` -> Setting up the password to login
 
 so by default when we are creating the users without any option, home directory for the user will not be created. To create the home directory for the existing user use the below command. 

 `sudo mkhomedir_helper <username>`

 To set the user password policy edit the file `/etc/pam.d/common-password`

