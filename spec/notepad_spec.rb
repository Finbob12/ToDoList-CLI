require_relative '../models/notepad_note'
require_relative '../models/notepad'

describe NotepadNote do
    it 'should create a new note item' do
        heading = 'groceries'
        contents = 'milk'
        note = NotepadNote.new(heading, contents)
        expect(note.heading).to eq(heading)
        expect(note.contents).to eq(contents)
    end
end

describe Notepad do
    it 'should add a note to the notepad' do
        notepad = Notepad.new
        heading = 'groceries'
        contents = 'milk'
        notepad.add_note(heading, contents)
        expect(notepad.get_notes.length).to be(1)
    end
    it 'item should have expected contents' do
        notepad = Notepad.new
        heading = 'groceries'
        contents = 'milk'
        notepad.add_note(heading, contents)
        expect(notepad.get_contents(heading)).to eq(contents)
    end
end