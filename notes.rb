require_relative 'dispatch'
require "tty-prompt"

begin
    prompt = TTY::Prompt.new
    input = prompt.select("Please select on option", %w(New Update List Show Delete))
    command, params = input
    dispatch command, params
end until ['quit', 'q', 'exit', ':q'].include? command
