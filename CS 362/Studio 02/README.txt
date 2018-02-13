Com S 362 Studio #2
Virtual Machine with Beaker installation at https://github.com/twosigma/beaker-notebook 

Group members:
Christian Klein
Derek Yu
Jay Patel
Joseph Thill
Zifeng Jiang

How to Run Virtual Machine and Beaker:

    1. The Virtual Machine is saved as a .ova file to be opened with VirtualBox. When opened, it will import all the proper settings and data for the virtual machine to be run.
    2. When opened it will automatically log into the "beaker" user account on the Ubuntu install. If it asks for the password, it is "password".
    3. Open Command Prompt
    4. Enter "export PATH=$PATH:/home/beaker/gradle-2.4/bin/"
    5. Navigate to the directory "beaker-notebook" with "cd beaker-notebook"
    6. Enter "gradle run" and the project will compile and run within a browser window. Creating a new notebook should work as intended.

--------------------------------------------------

Steps of compilation:
    1. After cloning the GitHub repository, we checked out the proper version, namely the version after commit "e8427bf770a39".
    2. Looking at build instructions for each operating system, we chose Ubuntu 14.04 to install Beaker on, due to the ease-of-installation provided by Ubuntu's package manager
        a. Starting from the project root, there is a script located in launcher/ubuntu called install-dependencies.sh. It is a script provided by the developers that automatically finds and downloads
           all required dependencies to build Beaker.
    3. However, since the version we are compiling is roughly a year old, it was compiled using an older version of Gradle, namely 2.4. The install-dependencies.sh script contains
       a command to install Gradle 2.4, but that is no longer a valid package in Ubuntu so the command fails. To fix this, we had to manually install Gradle by downloading version 2.4 off 
       their website.
    4. Once all dependencies were installed by script, and the proper version of Gradle was installed, we could attempt to build the program. Partway through compilation, it failed, reporting
       missing header files while running clang++. It seemed to missing some libraries due to strange interactions between 32 bit and 64 bit architectures. To fix this, we installed 
       the package "g++-multilib", which brought in the proper header files to finish the compilation.

Dependencies:  
    Even though there are many dependencies for this software, by choosing Ubuntu and running the provided script, we have avoided most the issues normally associated with installing dependencies.
    There were a few dependencies that needed to be installed by hand, such as Gradle 2.4 and some C/C++ header files.

    Fairly comprehensive list of dependencies:
        - Java 1.8
        - g++
        - make
        - git
        - Gradle 2.4
        - nginx 1.6
        - clang
        - R
        - ipython
        - Python 3
        - Ruby
        - Julia
        - Node.js
    

Steps to run code:
    1. After running the "gradle run" command in the "beaker-notebook" root folder, it will open a browser pointing the local running copy of Beaker.
    2. From there you can use the UI interfaces to make notebooks, and use the program as specified.
    3. There are test programs located in the "test" folder with the rest of the program. Typing "./runner" while in the test folder
       will run some general tests on the program.