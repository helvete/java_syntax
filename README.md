# java_syntax
Java 1.8 syntax validation cmd-line tool

Utilizes [ANTLR 4](https://github.com/antlr/antlr4/) and [java 8](https://github.com/antlr/grammars-v4/tree/master/java8) dictionary.

How to use this?
1. Make sure you there is `git`, `wget`, `java` and `make` installed

2. Clone the repository
```
git clone https://github.com/helvete/java_syntax.git
```
3. Run make
```
make
```
4. This should build the tool and package it into a `jar`file. There is also a [simple wrapper script](https://github.com/helvete/java_syntax/blob/master/run) to be symlinked to a place under `$PATH`. For example:
```
sudo ln -s /wherever/the/repository/is/cloned/run /usr/bin/java-syntax
```
5. Use it like this
```
java-syntax /path/to/a/file/to/Validate.java
```

For more details, feel free to inspect [the file itself](https://github.com/helvete/java_syntax/blob/master/Makefile). It's somewhat crude, but effective.
