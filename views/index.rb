
module Views
  module Notes
    def self.index(notes:) #creation of tty-table
      notes = notes.compact
      return puts 'No notes!' if notes.empty?

      headers = ['ID'.bold.blue, 'Heading'.bold.blue, 'Contents'.bold.blue]
      rows = table_rows_for notes
      table = TTY::Table.new headers, rows
      puts
      puts
      puts 'Below are all currently saved notes. If you wish to update or delete any, please use the ID #'
      puts table.render :unicode, padding: [0, 1, 0, 1]
    end

    def self.table_rows_for(notes)
      notes.map do |note|
        [note.id, note.heading, note.contents]
      end
    end
  end
end
