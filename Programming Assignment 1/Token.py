def enum(*args):
    enums = dict(zip(args, range(len(args))))
    return type('Enum', (), enums)
    
class Token:
    TokenCode = enum('ID', 'ASSIGN', 'SEMICOL', 'INT', 'PLUS', 'MINUS', 'MULT', 'LPAREN', 'RPAREN', 'PRINT', 'END', 'ERROR')
    def __init__(self, lex, tok):
            self.lexeme = lex
            self.tCode = tok;
