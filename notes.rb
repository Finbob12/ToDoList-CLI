require_relative 'dispatch'

begin
    print 'Choose an option (new, list, show , edit, delete, quit): '
    puts 'Please specify an ID # if using show, edit or delete'
    input = gets.chomp.downcase.strip.split(' ')
    command, params = input
    dispatch command, params
end until ['quit', 'q'].include? command
