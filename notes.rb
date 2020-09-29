require_relative 'dispatch'

begin
    print 'Enter your command (New, List, Show (#), Update (#), Delete(#), Quit): '
    input = gets.chomp.downcase.strip.split(' ')
    command, params = input
    dispatch command, params
end until ['quit', 'q', 'exit', ':q'].include? command