require 'yaml'

class Note
    TODOS = []
  
    attr_reader :id, :errors, :contents
    attr_accessor :heading
  
    def initialize(heading: nil, contents: nil)
      @id = nil
      @heading = heading
      @contents = contents
      @errors = {}
    end

    def contents=(contents)
      @contents = contents
    end
  
    def valid?
      true
    end
  
    def save!
      raise 'RecordNotSaved' unless valid?
      @id = TODOS.length + 1
      TODOS << self
      File.open('note.yml', 'w') { |file| file.write(TODOS.to_yaml) }
    end

    def self.help
      puts
      puts
      puts 'Please use your arrow keys to select what option you would like to do in ToDoList CLI'.colorize(:blue)
      print 'New: '.colorize(:magenta) 
      puts 'Creates a new note'
      print 'List: '.colorize(:magenta) 
      puts 'Shows all notes that have been created'
      print 'Show: '.colorize(:magenta) 
      puts 'Requests a note ID and shows that note'
      print 'Update: '.colorize(:magenta) 
      puts 'Requests a note ID and allows for editing of that note'
      print 'Delete: '.colorize(:magenta) 
      puts 'Requests a note ID and allows deleting of that note'
      print 'Quit: '.colorize(:magenta) 
      puts 'Exits the application'
      print 'Help: '.colorize(:magenta) 
      puts 'Opens the current dialogue'
      puts
      puts
    end
  
    def delete
      return if @id.nil? #guard for trying to delete nonexistent id
      idx = TODOS.index { |todo| todo.id == @id }
      @id = TODOS[idx] = nil
    end
  
    def to_s

    end
  
    def self.all
      TODOS
    end
  
    def self.find(id)
      id = id.to_i
      todo = TODOS.find { |a| a.id == id }
      raise "Invalid ID #{id}" unless todo
      todo
    end

    def self.fetch_id
      puts 'Please enter the ID #: '
      gets.chomp.to_i
    end

    def self.init
      TODOS.push *YAML.load(File.read('note.yml'))
    end
end