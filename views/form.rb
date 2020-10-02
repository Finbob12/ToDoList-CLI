module Views
    module Notes
      def self.form(note)
        begin
          prompt = TTY::Prompt.new
          input = prompt.ask('Heading: ') do |q|
            q.validate { |input| input =~ /[a-zA-Z0-9]/ }
            q.messages[:valid?] = "Please enter some text"
          end
          note.heading = !input.empty? ? input : note.heading
  
          prompt = TTY::Prompt.new
          input = prompt.ask('Contents: ') do |q|
          q.validate { |input| input =~ /[a-zA-Z0-9]/ }
          q.messages[:valid?] = "Please enter some text"
        end
          note.contents = !input.empty? ? input : note.contents

          puts note.errors.values unless note.valid?
        end until note.valid?
      end
    end
  end