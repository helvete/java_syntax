package checker;

import java.io.IOException;
import org.xml.sax.SAXException;
import org.antlr.v4.runtime.*;

public class Main {

    public static void main(String[] args) throws SAXException, IOException {

        ANTLRInputStream input = new ANTLRInputStream(System.in);
        Java8Lexer lexer = new Java8Lexer(input);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        Java8Parser parser = new Java8Parser(tokens);

        final StringBuilder errorMessages = new StringBuilder();
        parser.addErrorListener(new BaseErrorListener() {
            @Override
            public void syntaxError(Recognizer<?, ?> recognizer, Object offendingSymbol, int line, int charPositionInLine, String msg, RecognitionException e) {
                String err = String.format("Failed to parse at line %d:%d due to %s", line, charPositionInLine + 1, msg);
                errorMessages.append(err);
                errorMessages.append(System.lineSeparator());
            }
        });

        parser.compilationUnit();
        int syntaxErrors = parser.getNumberOfSyntaxErrors();

        if (syntaxErrors == 0) {
            System.out.println("Parser: PASS");
        } else {
            System.out.println("Parser: FAILED (" + syntaxErrors + " syntax errors)");
        }
    }
}
