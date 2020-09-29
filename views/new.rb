require_relative 'form'

module Views
  module Notes
    def self.new(note:)
      puts 'New Note!'
      form note
    end
  end
end
