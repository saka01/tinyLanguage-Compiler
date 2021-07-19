import java_cup.runtime.*;
%%

%implements java_cup.runtime.Scanner
%type Symbol
%function next_token
%class A4Scanner
%eofval{ return null;
%eofval}


%state COMMENT

%%

<YYINITIAL>"/**" {yybegin(COMMENT);}
<COMMENT>"**/" {yybegin(YYINITIAL);}
<COMMENT>. { }

<YYINITIAL>\"[^\"]*\" {return new Symbol(A4Symbol.QSTRING, yytext());}
<YYINITIAL>"," {return new Symbol(A4Symbol.COMMA);}
<YYINITIAL>"." {return new Symbol(A4Symbol.FSTOP);}
<YYINITIAL>";" {return new Symbol(A4Symbol.SEMICOLON);}
<YYINITIAL>":=" {return new Symbol(A4Symbol.ASSIGN);}
<YYINITIAL>"*" {return new Symbol(A4Symbol.TIMES);}
<YYINITIAL>"+" {return new Symbol(A4Symbol.PLUS);}
<YYINITIAL>"-" {return new Symbol(A4Symbol.MINUS);}
<YYINITIAL>"/" {return new Symbol(A4Symbol.DIVIDE);}
<YYINITIAL>"==" {return new Symbol(A4Symbol.EQUALS);}
<YYINITIAL>"!=" {return new Symbol(A4Symbol.NOTEQUALS);}
<YYINITIAL>"IF" {return new Symbol(A4Symbol.IF);}
<YYINITIAL>"WRITE" {return new Symbol(A4Symbol.WRITE);}
<YYINITIAL>"READ" {return new Symbol(A4Symbol.READ);}
<YYINITIAL>"RETURN" {return new Symbol(A4Symbol.RETURN);}
<YYINITIAL>"BEGIN" {return new Symbol(A4Symbol.BEGIN);}
<YYINITIAL>"END" {return new Symbol(A4Symbol.END);}
<YYINITIAL>"MAIN" {return new Symbol(A4Symbol.MAIN);}
<YYINITIAL>"ELSE" {return new Symbol(A4Symbol.ELSE);}
<YYINITIAL>"(" {return new Symbol(A4Symbol.LPAREN);}
<YYINITIAL>")" {return new Symbol(A4Symbol.RPAREN);}
<YYINITIAL> INT {return new Symbol(A4Symbol.INT);}
<YYINITIAL> REAL {return new Symbol(A4Symbol.REAL);}
<YYINITIAL> STRING {return new Symbol(A4Symbol.STRING);}
<YYINITIAL> TRUE {return new Symbol(A4Symbol.TRUE);}
<YYINITIAL> FALSE {return new Symbol(A4Symbol.FALSE);}
<YYINITIAL>[0-9] {return new Symbol(A4Symbol.DIGIT, yytext());}
<YYINITIAL>[a-zA-Z][a-zA-Z0-9]* { return new Symbol(A4Symbol.IDENTIFIER, yytext()); }

\r|\n|\t|" " { }
. {return new Symbol(A4Symbol.error);}