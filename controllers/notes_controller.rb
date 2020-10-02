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
    display note.id
  rescue => e
    puts e
  end

  def self.update
    requested_id = Note.fetch_id
    note = Note.find(requested_id)
    Views::Notes.new note: note
    display note.id
  rescue => e
    puts e
  end

  def self.help
    Note.help
  end

  def self.destroy
    requested_id = Note.fetch_id
    note = Note.find(requested_id) rescue nil
    return puts "Invalid ID # #{requested_id}" unless note
    note.delete
  end

  def self.show
    requested_id = Note.fetch_id
    note = Note.find(requested_id) rescue nil
    Views::Notes.show note: note
  end

  def self.display(id) #this is just for new & update to use show without requesting ID.
    note = Note.find(id) rescue nil
    Views::Notes.show note: note
  end
end
