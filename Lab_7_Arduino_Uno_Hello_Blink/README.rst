Peogramming Arduino from the Command Line
#########################################

The files in this repository demonstrate how to build C and assembly language
programs for the Arduino on any platform. This setup assumes that you have
installed the standard Arduino IDE on the platform you use, and you will use
the compiler/assembler in that system. This project also needs a current copy
of `GNU Make`, which can be installed on any system. Note that the ``Makefiles``
assume that the IDE is installed in the default location on each system. These
files may need modification if you installed the IDE in another location.

Project Setup
*************

There are two projects in this example repository, one written in C and one
written in assembly language. As configured in the repo, each project uses a
simple project level ``Makefile`` that includes other files needed to identify
your system and build projects. These additional files are located in the
``include`` directory.

A normal project would need to have the files in that ``include`` directory in
place in every project you create. This works, but is not an ideal setup.

System Wide Setup
*****************

To simplify project setup, you can install all the required ``Makefile``
component files that get included from a project level ``Makefile`` in a
standard system directory as follows:

..  code-block::    bash

    $ git clone https://github.com/rblack42/ArduinoAsm
    $ cd ArduinoAsm/include
    $ sudo cp AVR* /usr/local/include

..  warning::

    On a PC this directory does not exist. I choose to create it on all of my
    PC systems, to simplify building.

If you chose to use this option, be cure to set the include line properly in
your project ``Makefile``.  

Project Configuration 
*********************

The only changes you should need to make to use this build system for your
project are found in the project level ``Makefile. Settings found here identify
the processor on your Arduino board, the clock speed (in Hz), and the USB port
where the Arduino board is connected.  There are example lines for all three
major platforms. Uncomment and modify the lines appropriate for your system.

The top level Makefile will build both C and assembly language projects. You
can run any of these commands:

    * ``make`` - build both program files
    * ``make clean`` - remove nonessential files
    * ``make install`` copy Makefile components to /usr/local/include

In each project directory, these commands are available:

    * ``make`` - builds the program file
    * ``make clean`` remove all nonessential files
    * ``make load`` load the program file onto the Arduino board.

