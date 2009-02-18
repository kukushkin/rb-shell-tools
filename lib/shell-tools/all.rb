
# Execs cmd in a shell and returns true if command executed successfully, 
# or throws an exception if command failed.
#
def sh( cmd, echo = true )
  puts cmd if echo
  system cmd or raise "Failed to execute: #{cmd}: #{$?}"
end


# Copy file if newer.
#
def copy_if_newer( from, to, echo = true )
  # if Mac OS X:
  os = os_name()
  if os == 'macosx'
    sh "cp -n #{from} #{to}", echo
  else
    # update, force, preserve attrs
    sh "cp -ufp #{from} #{to}", echo
  end
end

# Returns the amount in bytes of free disk space in the specified folder.
#
def fs_disk_free( path )
  result = `df -k #{path}`.split("\n")[1]
  device, d_size, d_usage, d_free = result.split(" ")[0..3]
	  
  d_free.to_i*1024 # in bytes
end

# Returns the amount in bytes of used disk space in the specified folder.
#
def fs_disk_used( path )
  # First, dereference path
  if File.symlink? @path 
    p = File.readlink( @path )
  else
    p = @path
  end
	result = `du -ks #{p}`
	m = /(\d+)\s+.*/.match result
	if m
		m[1].to_i*1024
	else
		result
	end
end

# Returns a host OS name in lowercase.
#
def os_name
  name = `uname`
  name.chomp!
  
  case name
  when 'Darwin' : 'macosx'
  when 'Linux' : 'linux'
  else 
    "unknown(#{name})"
  end
end


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
