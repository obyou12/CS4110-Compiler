# CS4110-Compiler-Project2

This project was written in Java (java 15.0.1 downloaded from https://www.oracle.com/java/technologies/javase-jdk15-downloads.html) and
utilizes the lexical analyzer generator JFLEX (version 1.8.2 downloaded from https://jflex.de/download.html) and
LALR parser generator Cup (version 11b downloaded from https://github.com/duhai-alshukaili/CUP).
The project is ran via the Eclipse IDE (2020-09 downloaded from https://www.eclipse.org/downloads/).

Steps to run:

1: Download the git repository.

2: Create a Java project in Eclipse. In the New Java Project wizard, deselect default location and choose the downloaded folder downloaded from the git repository. Click [Next] button and deselect create module-info.java . Click the Libraries tab and click Classpath and [Add External Jars...] button. Navigate to and select CUP\lib\java-cup-11b-runtime wherever CUP has been downloaded.

3: In the toolbar, click the triangle by the Run Main button and click the [Run Configurations] option. Go to the Arguments tab and add the name of the input file you would like to test as the Program Argument.

4: Check the console for the output.

P.S. If either the toy.cup or Toy.flex files are modified, then they will have to be recompiled using the commands below

New filename.flex (Toy.flex in our project) files can be compiled by using a command line and running the command "jflex filename.flex." This will generate a filename.java file which can then be dragged and overwritten in the project explorer in Eclipse.  It can be also be linked at this step so it doesn't have to be manually dragged after each compiling.

New filename.cup (toy.cup in our project) files can be compiled by running the command "cup filename.cup". This will generate a parser.java and sym.java file which can then be dragged and overwritten in the project explorer in Eclipse. They can be also be linked at this step so it doesn't have to be manually dragged after each compiling.
