module Views
    module Notes
      def self.show(note:)
        return puts 'Note not found' unless note
  
        headings = %w[ToDoList CLI]
        contents = attribute_rows_for note
        table = TTY::Table.new headings, contents
  
        puts "Note #{note.id}"
        puts table.render :unicode
      end
  
      def self.attribute_rows_for(note)
        rows = []
        rows << ['Id', note.id]
        rows << ['Heading', note.heading]
        rows << ['Contents', note.contents]
      end
    end
  end