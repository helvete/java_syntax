#!/usr/bin/make -f

run: antlr4-4.5.3.jar Java8.g4
	java -jar antlr4-4.5.3.jar ./Java8.g4
	mv *.class ./checker/
	javac -cp antlr4-4.5.3.jar ./checker/*.java
	jar cfm checker.jar Manifest.txt checker/*.class
	echo "Now execute via running 'java -jar ./checker.jar < ./checker/Main.java'"
	java -jar ./checker.jar < ./checker/Main.java

antlr4-4.5.3.jar:
	wget https://repo1.maven.org/maven2/org/antlr/antlr4/4.5.3/antlr4-4.5.3.jar -O antlr4-4.5.3.jar

Java8.g4:
	wget https://raw.githubusercontent.com/antlr/grammars-v4/master/java8/Java8.g4 -O Java8.g4
