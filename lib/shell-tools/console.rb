
# Replaces current line in the output with a new one.
#
def putr( str )
  # move cursor to beginning of line
  cr = "\r"           

  # ANSI escape code to clear line from cursor to end of line
  # cf. http://en.wikipedia.org/wiki/ANSI_escape_code
  clear = "\e[0K"     

  # reset lines
  reset = cr + clear

  print "#{reset}#{str}"
  $stdout.flush
end

# Clears console screen and puts cursor in 0,0.
#
def put_cls
  cls = `clear`
  putr cls
end

# Returns ANSI escaped string for the red colored text.
#
def esc_red( text )
  "\e[31m"+text+"\e[0m"
end

# Returns ANSI escaped string for the green colored text.
#
def esc_green( text )
  "\e[32m"+text+"\e[0m"
end

# Returns ANSI escaped string for the yellow colored text.
#
def esc_yellow( text )
  "\e[33m"+text+"\e[0m"
end

# Returns ANSI escaped string for the blue colored text.
#
def esc_blue( text )
  "\e[34m"+text+"\e[0m"
end

# Returns ANSI escaped string for the bold text.
#
def esc_bold( text )
  "\e[01;37m"+text+"\e[22m"
end