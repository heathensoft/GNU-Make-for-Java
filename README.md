
## GNU Make for Java projects

### Compile and/or build .jar of your project with GNU Make.

Make is often used to build C code. And i wanted to see if it would be viable with Java.

Compiling Java is fast. But only when you compile the source code as a bundle.

Make is structured as a dependency tree where evey file is compiled one by one.

Compiling .java files one by one this way is slow. But it does work.


## How

First of all you will need [GNU Make] (https://www.gnu.org/software/make/)
On linux i think it comes with the OS.
For windows it is available as a package in environments like:
* [MinGW](https://sourceforge.net/projects/mingw/)
* [MinGW-w64](https://www.mingw-w64.org/)
* [Cygwin](https://www.cygwin.com/)
* [Msys2](https://www.msys2.org/)

Structure your project like this:

    └── Root/
        ├── Makefile
        ├── Manifest.txt
        ├── src/
        │   └── java
        └── out

And place your project inside of the /java subfolder (src/java/com/my/package)


#### Compile

Outputs your project into out/ as .class files

in the terminal: make compile

#### Jar

Compiles then creates a jar of your project inside of the /out folder

If you want to use a manifest you need to set it's relative path inside the Makefile

in the terminal: make jar

#### Clean

Deletes the output (jar and .class files)

in the terminal: make clean