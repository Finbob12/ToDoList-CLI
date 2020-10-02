module Views
    module Notes
      def self.form(note)
        begin
          prompt = TTY::Prompt.new
          input = prompt.ask('Heading: ') do |q|
            q.validate { |input| input =~ /^[ A-Za-z0-9_@,=()$.#&+-]{1,170}$/ }
            q.messages[:valid?] = "You have entered nothing, or are over the 170 character limit. Please try again"
          end
          note.heading = !input.empty? ? input : note.heading
  
          prompt = TTY::Prompt.new
          input = prompt.ask('Contents: ') do |q|
          q.validate { |input| input =~ /^[ A-Za-z0-9_@,=()$.#&+-]{1,170}$/ }
          q.messages[:valid?] = "You have entered nothing, or are over the 170 character limit. Please try again"
        end
          note.contents = !input.empty? ? input : note.contents

          puts note.errors.values unless note.valid?
        end until note.valid?
      end
    end
  end