require_relative './notepad_note'

class Notepad
    def initialize
        @notepad_notes = []
    end

    def add_note(heading, contents)
        notepad_note = NotepadNote.new(heading, contents)
        @notepad_notes << notepad_note
    end

    def get_notes
        return @notepad_notes
    end

    def get_contents(note_heading)
        @notepad_notes.each do |note|
            if note.heading == note_heading
                return note.contents
            end
        end
        return nil
    end
end