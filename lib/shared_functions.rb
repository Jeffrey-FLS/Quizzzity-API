
require 'colorize'  

module Shared
    def console_msg(level, msg) 

        # puts "JEELLLOOOOO"
        puts "\n "
    
        case level
        when "normal"
        #  puts "HEELLLOOOO".colorize(:blue)
         puts "#{msg}".colorize(:blue)
        else
          puts "WHHYYY"
        end
    
        puts "\n "
        # puts "\n #{msg} \n ".red
      end   
end