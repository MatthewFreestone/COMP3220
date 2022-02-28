# https://www.cs.rochester.edu/~brown/173/readings/05_grammars.txt
#
#  "TINY" Grammar
#
# PGM        -->   STMT+
# STMT       -->   ASSIGN   |   "print"  EXP
# ASSIGN     -->   ID  "="  EXP
# EXP        -->   TERM   ETAIL
# ETAIL      -->   "+" TERM   ETAIL  | "-" TERM   ETAIL | EPSILON
# TERM       -->   FACTOR  TTAIL
# TTAIL      -->   "*" FACTOR TTAIL  | "/" FACTOR TTAIL | EPSILON
# FACTOR     -->   "(" EXP ")" | INT | ID
# ID         -->   ALPHA+
# ALPHA      -->   a  |  b  | … | z  or
#                  A  |  B  | … | Z
# INT        -->   DIGIT+
# DIGIT      -->   0  |  1  | …  |  9
# WHITESPACE -->   Ruby Whitespace

#
#  Parser Class
#
load "Token.rb"
load "Lexer.rb"
class Parser < Scanner
	def initialize(filename)
    	super(filename)
    	consume()
		@error_count = 0
   	end
   	
	def consume()
      	@lookahead = nextToken()
      	while(@lookahead.type == Token::WS)
        	@lookahead = nextToken()
      	end
   	end
  	
	def match(dtype)
      	if (@lookahead.type != dtype)
         	puts "Expected #{dtype} found #{@lookahead.text}"
			@error_count += 1
		# else 
		# 	puts "Found #{dtype.name} Token: #{@lookahead.text}"
		end
      	consume()
   	end
   	
	# PGM        -->   STMT+
	def program()
      	while( @lookahead.type != Token::EOF)
        	puts "Entering STMT Rule"
			statement()  
      	end
		puts "There were #{@error_count} parse errors found."
   	end

	# STMT       -->   ASSIGN   |   "print"  EXP
	def statement()
		if (@lookahead.type == Token::PRINT)
			puts "Found PRINT Token: #{@lookahead.text}"
			match(Token::PRINT)
			exp()
		else
			assign()
		end
		
		puts "Exiting STMT Rule"
	end

	# ASSIGN     -->   ID  "="  EXP
	def assign()
		puts "Entering ASSGN Rule"

		id()

		if (@lookahead.type == Token::ASSGN)
			puts "Found ASSGN Token: #{@lookahead.text}"
		end
		match(Token::ASSGN)
		
		exp()

		puts "Exiting ASSGN Rule"
	end

	# EXP        -->   TERM   ETAIL
	def exp()
		puts "Entering EXP Rule"
		term()
		etail()
		puts "Exiting EXP Rule"
	end

	# ETAIL      -->   "+" TERM   ETAIL  | "-" TERM   ETAIL | EPSILON
	def etail()
		puts "Entering ETAIL Rule"

		if (@lookahead.type == Token::ADDOP)
			puts "Found ADDOP Token: #{@lookahead.text}"
			match(Token::ADDOP)
			term()
			etail()
		elsif (@lookahead.type == Token::SUBOP)
			puts "Found SUBOP Token: #{@lookahead.text}"
			match(Token::SUBOP)
			term()
			etail()
		else
			puts "Did not find ADDOP or SUBOP Token, choosing EPSILON production"
		end

		puts "Exiting ETAIL Rule"
	end

	# TERM       -->   FACTOR  TTAIL
	def term()
		puts "Entering TERM Rule"
		factor()
		ttail()
		puts "Exiting TERM Rule"
	end

	# TTAIL      -->   "*" FACTOR TTAIL  | "/" FACTOR TTAIL | EPSILON
	def ttail()
		puts "Entering TTAIL Rule"

		if (@lookahead.type == Token::MULTOP)
			puts "Found MULTOP Token: #{@lookahead.text}"
			match(Token::MULTOP)
			factor()
			ttail()
		elsif (@lookahead.type == Token::DIVOP)
			puts "Found DIVOP Token: #{@lookahead.text}"
			match(Token::DIVOP)
			factor()
			ttail()
		else
			puts "Did not find MULTOP or DIVOP Token, choosing EPSILON production"
		end

		puts "Exiting TTAIL Rule"
	end

	# FACTOR     -->   "(" EXP ")" | INT | ID
	def factor()
		puts "Entering FACTOR Rule"
		
		if (@lookahead.type == Token::LPAREN)
			puts "Found LPAREN Token: #{@lookahead.text}"
			match(Token::LPAREN)
			exp()
			puts "Found RPAREN Token: #{@lookahead.text}"
			match(Token::RPAREN)
		elsif (@lookahead.type == Token::INT)
			int()
		elsif (@lookahead.type == Token::ID)
			id()
		else 
			puts "Expected #{Token::LPAREN} or #{Token::INT.upcase} or #{Token::ID.upcase} found #{@lookahead.text}"
			@error_count += 1
		end

		puts "Exiting FACTOR Rule"
	end

	# ID         -->   ALPHA+
	def id()
		if (@lookahead.type == Token::ID)
			puts "Found ID Token: #{@lookahead.text}"
		end
		match(Token::ID)
	end

	# INT        -->   DIGIT+
	def int()
		if (@lookahead.type == Token::INT)
			puts "Found INT Token: #{@lookahead.text}"
		end
		match(Token::INT)
	end


end