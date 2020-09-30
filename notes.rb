require_relative 'dispatch'
require 'tty-prompt'
require 'colorize'


puts '

 _______    _____        _      _     _        _____ _      _____ 
|__   __|  |  __ \      | |    (_)   | |      / ____| |    |_   _|
   | | ___ | |  | | ___ | |     _ ___| |_    | |    | |      | |  
   | |/ _ \| |  | |/ _ \| |    | / __| __|   | |    | |      | |  
   | | (_) | |__| | (_) | |____| \__ \ |_    | |____| |____ _| |_ 
   |_|\___/|_____/ \___/|______|_|___/\__|    \_____|______|_____|
                                                                 
                                                                 '.colorize(:magenta)
begin
    prompt = TTY::Prompt.new
    input = prompt.select("What would you like to do?", %w(New List Show Update Delete Quit))
    command, id = input.downcase
    dispatch command, id
end until ['quit', 'q', 'exit', ':q'].include? command