require_relative 'dispatch'
require_relative 'models/note.rb'
require 'tty-prompt'
require 'colorize'

Note.init

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
    input = prompt.select("What would you like to do?", %w(New List Show Update Delete Help Quit))
    selection = input.downcase
    dispatch selection
end until ['quit', 'q', 'exit', ':q'].include? selection