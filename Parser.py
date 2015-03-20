from Token import Token
from Lexer import Lexer

class Parser:
    def __init__(self, lex):
        self.lexer = lex;
        self.currentToken = self.lexer.nextToken()


    def parse(self):
        self.statements()

    def statements(self):
        if self.currentToken.tCode == Token.TokenCode.END:
            return
        else:
            self.statement()
            if self.currentToken.tCode == Token.TokenCode.SEMICOL:
                self.currentToken = self.lexer.nextToken()
                self.statements()
            else:
                self.error()

    def statement(self):
        if self.currentToken.tCode == Token.TokenCode.ID:
            print "PUSH " + self.currentToken.lexeme

            self.currentToken = self.lexer.nextToken()
            if self.currentToken.tCode == Token.TokenCode.ASSIGN:
                self.currentToken = self.lexer.nextToken()
                self.expr()
                print "ASSIGN"
            else:
                self.error()
        elif self.currentToken.tCode == Token.TokenCode.PRINT:
            self.currentToken = self.lexer.nextToken()
            if self.currentToken.tCode == Token.TokenCode.ID:
                print "PUSH " + self.currentToken.lexeme
            else:
                self.error()
            print "PRINT"
            self.currentToken = self.lexer.nextToken()
        else:
            self.error()


    def expr(self):
        self.term()
        if self.currentToken.tCode == Token.TokenCode.PLUS:
            self.currentToken = self.lexer.nextToken()
            self.expr()
            print "ADD"
        elif self.currentToken.tCode == Token.TokenCode.MINUS:
            self.currentToken = self.lexer.nextToken()
            self.expr()
            print "SUB"
        

    def term(self):
        self.factor()
        if self.currentToken.tCode == Token.TokenCode.MULT:
            self.currentToken = self.lexer.nextToken()
            self.term()
            print "MULT"
            
    def factor(self):
        #import pdb; pdb.set_trace()
        if self.currentToken.tCode == Token.TokenCode.INT:
            print "PUSH " + self.currentToken.lexeme
            self.currentToken = self.lexer.nextToken()
        elif self.currentToken.tCode == Token.TokenCode.ID:
            print "PUSH " + self.currentToken.lexeme
            self.currentToken = self.lexer.nextToken()
        elif self.currentToken.tCode == Token.TokenCode.LPAREN:
            self.currentToken = self.lexer.nextToken()
            self.expr()
            if self.currentToken.tCode ==Token.TokenCode.RPAREN:
                self.currentToken = self.lexer.nextToken()
                return
            else:
                self.error()
        else:
            self.error()

    def error(self):
        print "Syntax error!"
        quit()



