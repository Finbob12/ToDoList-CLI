module Views
    module Notes
      def self.form(note)
        begin
          print 'Heading: '
          print " (#{note.heading})" unless note.heading.nil?
          print ': '
          input = gets.chomp.strip
          note.heading = !input.empty? ? input : note.heading
  
          print 'Contents: '
          print " (#{note.contents})" unless note.contents.nil?
          print ': '
          input = gets.chomp.strip
          note.contents = !input.empty? ? input : note.contents
  
          puts note.errors.values unless note.valid?
        end until note.valid?
      end
    end
  end
  