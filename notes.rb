require_relative 'dispatch'
require "tty-prompt"

begin
    prompt = TTY::Prompt.new
    input = prompt.select("Please select on option", %w(New Update List Show Delete Quit))
    command, params = input.downcase
    dispatch command, params
end until ['quit', 'q', 'exit', ':q'].include? command
