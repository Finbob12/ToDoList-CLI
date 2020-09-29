require_relative '../models/note'
require_relative '../views/index'
require_relative '../views/show'
require_relative '../views/new'
require_relative '../views/update'

module NotesController
  def self.index
    note = Note.all
    Views::Notes.index notes: note
  end

  def self.new
    note = Note.new
    Views::Notes.new note: note
    note.save!
    show note.id
  rescue => e
    puts e
  end

  def self.update(id)
    note = Note.find(id)
    Views::Notes.new note: note
    show note.id
  rescue => e
    puts e
  end

  def self.delete(id)
    note = Note.find(id) rescue nil
    return unless note
    note.delete
  end

  def self.show(id)
    note = Note.find(id) rescue nil
    Views::Notes.show note: note
  end
end
