#!/usr/bin/make -f
main: run

run: antlr4-4.5.3.jar Java8.g4
	java -jar antlr4-4.5.3.jar ./Java8.g4
	mv *.java ./checker/
	( test -f ./checker/Java8Lexer.j || mv ./checker/Java8Lexer.java ./checker/Java8Lexer.j ) && cat ./prepend_package ./checker/Java8Lexer.j > ./checker/Java8Lexer.java
	( test -f ./checker/Java8Parser.j || mv ./checker/Java8Parser.java ./checker/Java8Parser.j ) && cat ./prepend_package ./checker/Java8Parser.j > ./checker/Java8Parser.java
	( test -f ./checker/Java8Listener.j || mv ./checker/Java8Listener.java ./checker/Java8Listener.j )  && cat ./prepend_package ./checker/Java8Listener.j > ./checker/Java8Listener.java
	( test -f ./checker/Java8BaseListener.j || mv ./checker/Java8BaseListener.java ./checker/Java8BaseListener.j ) && cat ./prepend_package ./checker/Java8BaseListener.j > ./checker/Java8BaseListener.java
	javac -cp antlr4-4.5.3.jar ./checker/*.java
	jar cfm checker.jar Manifest.txt checker/*.class
	java -jar ./checker.jar ./checker/Main.java

antlr4-4.5.3.jar:
	wget https://repo1.maven.org/maven2/org/antlr/antlr4/4.5.3/antlr4-4.5.3.jar -O antlr4-4.5.3.jar

Java8.g4:
	wget https://raw.githubusercontent.com/antlr/grammars-v4/master/java8/Java8.g4 -O Java8.g4
