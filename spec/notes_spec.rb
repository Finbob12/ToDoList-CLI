require_relative '../models/note.rb'

RSpec.describe Note do
    describe 'instance methods' do
        let(:note) { Note.new }
        it 'should respond to id' do
            expect(note).to respond_to :id #checks if instances of note respond to the 'id' value
        end

        it 'should respond to heading' do
            expect(note).to respond_to :heading #checks if instances of note respond to the 'heading' value
        end

        it 'should respond to contents' do
            expect(note).to respond_to :contents #checks if instances of note respond to the 'contents' value
        end
    end

    describe 'contents' do
        let(:note) { Note.new }

        it 'should be able to be assigned' do
            note.contents = 'test'
            expect(note.contents).to eq 'test' #checks if when contents is assigned the string 'test', it holds and does actually = 'test'
        end

        it 'should be a string' do
            note.contents = 'a'
            expect(note.contents).to eq 'a' #checks if a note with contents = 'a' actually = 'a'
        end
    end

    describe 'save' do
        it 'should be inserted into the TODOS array' do
            note = Note.new
            expect { note.save! }.to change(Note::TODOS, :size).by(1) #checks that saving a new instance of note increases the constant storing the arrays size by 1 
        end
    end

    describe 'delete' do
        it 'should set id to nil' do
            note = Note.new
            note.save!
            note.delete
            expect(note.id).to be_nil #check that by creating and then deleting a new note instance sets it's ID to nil
        end

        it 'should ignore unsaved notes' do
            note = Note.new
            expect(note.delete).to be_nil #check that the delete method doesnt delete something that isn't there
        end
    end
end