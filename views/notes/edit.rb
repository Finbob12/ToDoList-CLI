require_relative 'form'

module Views
  module Notes
    def self.edit(note:)
      puts "Edit #{note.id}"
      form note
    end
  end
end
