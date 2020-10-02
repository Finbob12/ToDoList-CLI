
module Views
    module Notes
      def self.show(note:)
        return puts 'Invalid ID number' unless note
  
        contents = attribute_rows_for note
        table = TTY::Table.new contents
        
        puts
        puts
        puts "If you wish to 'update' or 'delete' this note please use this ID # '#{note.id}'"
        puts table.render(:unicode, padding: [0, 1, 0, 1])
      end
  
      def self.attribute_rows_for(note)
        rows = []
        rows << ['Id', note.id]
        rows << ['Heading', note.heading]
        rows << ['Contents', note.contents]
      end
    end
  end