require_relative 'dispatch'
require 'tty-prompt'
require 'colorize'

puts '
                   _ _ _ _ _ _ _ _ _ _ _ 
                  (-(-(-(-(-(-(-(-(-(-(-() 
                  /¯ ¯ ¯ ¯ ¯ ¯ ¯ ¯ ¯ ¯ /|| 
                 /                    /_|| 
                /                    /__|| 
               //|  /               /___|| 
              // | / ___/_ _  _    /____|| 
             //  |/(_) (__(/_/_)_ /_____|| 
            /( _ _ _ _ _ _ _ _ _ /______|| 
           /  ¯ ¯ ¯ ¯ ¯ ¯ ¯ ¯ ¯ /_______|| 
          /                    /________|| 
         /                    /_________|| 
        (____________________(__________|| 
                   |____________________|| 
                   |____________________|| 
                   |____________________|| 
                   |____________________|| 
                   |____________________|| 
                   |____________________|/
 _______    _____        _      _     _        _____ _      _____ 
|__   __|  |  __ \      | |    (_)   | |      / ____| |    |_   _|
   | | ___ | |  | | ___ | |     _ ___| |_    | |    | |      | |  
   | |/ _ \| |  | |/ _ \| |    | / __| __|   | |    | |      | |  
   | | (_) | |__| | (_) | |____| \__ \ |_    | |____| |____ _| |_ 
   |_|\___/|_____/ \___/|______|_|___/\__|    \_____|______|_____|
                                                                 
                                                                 '.colorize(:magenta)
begin
    prompt = TTY::Prompt.new
    input = prompt.select("What would you like to do?", %w(New List Show Update Delete Help Quit), symbols: { marker: "✎" })
    selection = input.downcase
    dispatch selection
end until ['quit', 'q', 'exit', ':q'].include? selection