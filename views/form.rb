module Views
    module Notes
      def self.form(note)
        begin
          prompt = TTY::Prompt.new
          input = prompt.ask('Heading: ')
          note.heading = !input.empty? ? input : note.heading
  
          prompt = TTY::Prompt.new
          input = prompt.ask('Contents: ')
          note.contents = !input.empty? ? input : note.contents
  
          puts note.errors.values unless note.valid?
        end until note.valid?
      end
    end
  end