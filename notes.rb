require_relative 'dispatch'
require 'tty-prompt'
require 'colorize'
require 'artii'
require 'tty-table'
require 'rainbow'

puts Rainbow('
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
                   |____________________|/').bright

x = Artii::Base.new
puts x.asciify("ToDoList CLI").blue

                                                                 
                                                                 
begin
    prompt = TTY::Prompt.new
    input = prompt.select("What would you like to do?", %w(New List Show Update Delete Help Quit), symbols: { marker: "✎" })
    selection = input.downcase
    dispatch selection
end until ['quit', 'q', 'exit', ':q'].include? selection