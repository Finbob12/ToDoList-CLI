module Views
    module Notes
      def self.form(note) #forms a new note. Validation is done here through tty-prompt to check that note isnt empty and isnt so long it breaks tty-table
        begin
          prompt = TTY::Prompt.new
          input = prompt.ask('Heading: ') do |q|
            q.validate { |input| input =~ /^[ A-Za-z0-9_@,=()$.#&+-]{1,140}$/ }
            q.messages[:valid?] = "You have entered nothing, or are over the 140 character limit. Please try again"
          end
          note.heading = !input.empty? ? input : note.heading
  
          prompt = TTY::Prompt.new
          input = prompt.ask('Contents: ') do |q|
          q.validate { |input| input =~ /^[ A-Za-z0-9_@,=()$.#&+-]{1,140}$/ }
          q.messages[:valid?] = "You have entered nothing, or are over the 140 character limit. Please try again"
        end
          note.contents = !input.empty? ? input : note.contents

          puts note.errors.values unless note.valid?
        end until note.valid?
      end
    end
  end