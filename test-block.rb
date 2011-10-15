require './lib/shell-tools'

out = ''
out_nest = ''
sh_capture_output( out ) do 
  sh "ls -la"
  puts ""
  puts "captured inside:"
  out1 = ''
  sh "ruby test-ok.rb", true, out1
  puts "out1: #{out1}"
  
  puts "nested block:"
  sh_capture_output( out_nest ) do 
    sh "ruby test-err.rb" rescue puts esc_red "sh raised an exception, recovered"
  end
end


puts
puts "Globally captured output:"
puts out

puts
puts "Nested captured output:"
puts out_nest

