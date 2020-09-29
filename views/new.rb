require_relative 'form'

module Views
  module Notes
    def self.new(note:)
      puts 'Please enter the heading and contents of your new note'
      puts
      form note
    end
  end
end
