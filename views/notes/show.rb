module Views
    module Notes
      def self.show(note:)
        return puts 'Note not found' unless note
  
        headers = %w[ToDoList CLI]
        attrs = attribute_rows_for note
        table = TTY::Table.new headers, attrs
  
        puts "Note #{note.id}"
        puts table.render :ascii
      end
  
      def self.attribute_rows_for(note)
        rows = []
        rows << ['Id', note.id]
        rows << ['Heading', note.heading]
        rows << ['Contents', note.contents]
      end
    end
  end