require 'tty-table'

module Views
  module Notes
    def self.index(notes:)
      notes = notes.compact
      return puts 'No notes!' if notes.empty?

      headers = %w[Id Heading Contents]
      rows = table_rows_for notes
      table = TTY::Table.new headers, rows

      puts 'Notes!'
      puts table.render :ascii
    end

    def self.table_rows_for(notes)
      notes.map do |note|
        [note.id, note.heading, note.contents]
      end
    end
  end
end
