require_relative '../models/note_item'

describe NoteItem do
    it 'should create a new note item' do
        heading = 'groceries'
        contents = 'milk'
        item = NoteItem.new(heading, contents)
        expect(item.heading).to eq(heading)
        expect(item.contents).to eq(contents)
    end
end