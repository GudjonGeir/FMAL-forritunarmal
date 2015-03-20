from Token import Token
import sys
import re

class Lexer:
    # Constructor
    def __init__(self):
        self.hasLine = False
        self.inputLine = ""
        self.index = 0

    # The method reads from input if the object hasn't already.
    # Then it loops through a list of regex rules and their corresponding
    # TokenCodes and checks if the inputLine matches any of them.
    def nextToken(self):
        if not self.hasLine:
            self.inputLine = sys.stdin.read()
            self.hasLine = True
        self.inputLine = "".join(self.inputLine.split())  # Remove whitespace
        
        lexemes = [
                ("end", Token.TokenCode.END),
                ("print", Token.TokenCode.PRINT),
                ("\+", Token.TokenCode.PLUS),
                ("\-", Token.TokenCode.MINUS),
                ("\*", Token.TokenCode.MULT),
                ("\(", Token.TokenCode.LPAREN),
                ("\)", Token.TokenCode.RPAREN),
                ("=", Token.TokenCode.ASSIGN),
                ("\;", Token.TokenCode.SEMICOL),
                ("[0-9]+", Token.TokenCode.INT),
                ("[A-Za-z]+", Token.TokenCode.ID)]
        
        # index is where it starts searching for a match. When a match is found
        # it is updated to the end of the match for when the method is called next
        for lex, tok in lexemes:
            match = re.match(lex, self.inputLine[self.index:])
            if match:
                newtok = Token(self.inputLine[self.index:self.index+match.end()], tok)
                self.index += match.end()
                return newtok
        return Token("error", Token.TokenCode.ERROR) # if no match is found return error


    

