require_relative '../models/note'
require_relative '../views/index'
require_relative '../views/show'
require_relative '../views/new'
require_relative '../views/update'

module NotesController
  def self.index #calls the index method in views
    note = Note.all
    Views::Notes.index notes: note
  end

  def self.new #calls for new instance of note in the model, calls for save function which sets ID and saves to yaml, then calls display function to put on screen the new note.
    note = Note.new
    Views::Notes.new note: note
    note.save!
    display note.id
  rescue => e
    puts e
  end

  def self.update #Calls fetch ID to ask for user input, calls find ID for the given ID, then a new instance of note is created OVER the old one. Display is then called to show the updated note.
    requested_id = Note.fetch_id
    note = Note.find(requested_id)
    Views::Notes.new note: note
    display note.id
  rescue => e
    puts e
  end

  def self.help #Calls help method which displays menu options to the user.
    Note.help
  end

  def self.destroy #Calls fetch ID to ask for user input, calls find ID for the given ID, then calls delete method which sets a given ID to nil.
    requested_id = Note.fetch_id
    note = Note.find(requested_id) rescue nil
    return puts "Invalid ID number" unless note
    note.delete
  end

  def self.show #Calls fetch ID to ask for user input, calls find ID for the given ID, calls show method to display note.
    requested_id = Note.fetch_id
    note = Note.find(requested_id) rescue nil
    Views::Notes.show note: note
  end

  def self.display(id) #this method along with fetch_id were created due to TTY prompt issues with menu selections and ID numbers
    note = Note.find(id) rescue nil
    Views::Notes.show note: note
  end
end
