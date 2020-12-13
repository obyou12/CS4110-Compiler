# CS4110-Compiler-Project1

This project was written in Java (java 15.0.1 downloaded from https://www.oracle.com/java/technologies/javase-jdk15-downloads.html) and
utilizes the lexical analyzer generator JFLEX (version 1.8.2 downloaded from https://jflex.de/download.html) and
LALR parser generator Cup (version 11b downloaded from https://github.com/duhai-alshukaili/CUP).
The project is ran via the Eclipse IDE (2020-09 downloaded from https://www.eclipse.org/downloads/).

New filename.flex (Toy.flex in our project) files can be compiled by using a command line and running the command "jflex filename.flex" to turn them into filename.java files.

New filename.cup (toy.cup in our project) files can be compiled by running the command "cup filename.cup" to generate into parser.java and sym.java files.

Steps to run:

1: Download the git repo.

2: Create a Java project in Eclipse. In the New Java Project wizard, deselect default location and choose the downloaded git repo.

3: Move folders with programs to src, making Main.java the default package. Move the inputs to the project file.(Make sure your Toy file is linked to same package.)

4: In the Eclipse package explorer, configure the properties. Under the libraries tab of the Java Build Path option, add the java-cup-11b-runtime.jar from Cup/lib as an external jar.

5: Run the program with Run Configurations and go to Arguments. After add the name of the input file as the Program Argument.

6: Check the console for the output.
