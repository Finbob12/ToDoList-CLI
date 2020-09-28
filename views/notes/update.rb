require_relative 'form'

module Views
  module Notes
    def self.update(note:)
      puts "Update #{note.id}"
      form note
    end
  end
end
