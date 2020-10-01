require_relative '../models/note.rb'

RSpec.describe Note do
    describe 'instance methods' do
        let(:note) { Note.new }
        it 'should respond to id' do
            expect(note).to respond_to :id
        end

        it { is_expected.to respond_to :id }

        it 'should respond to heading' do
            expect(note).to respond_to :heading
        end

        it 'should respond to contents' do
            expect(note).to respond_to :contents
        end
    end

    describe 'contents' do
        let(:note) { Note.new }

        it 'should be able to be assigned' do
            note.contents = 1
            expect(note.contents).to eq 1
        end

        it 'should be a string' do
            note.contents = 'a'
            expect(note.contents).to eq 'a'
            note.contents = '1'
            expect(note.contents).to eq '1'
        end
    end

    describe 'save' do
        it 'should be inserted into the TODOS array' do
            note = Note.new
            expect { note.save! }.to change(Note::TODOS, :size).by(1)
        end
    end

    describe 'delete' do
        it 'should set id to nil' do
            note = Note.new
            note.save!
            note.delete
            expect(note.id).to be_nil
        end

        it 'should ignore unsaved notes' do
            note = Note.new
            expect(note.delete).to be_nil
        end
    end
end