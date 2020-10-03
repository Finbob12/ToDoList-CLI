require 'yaml'

class Note
    TODOS = YAML.load(File.read('todo.yml')) rescue [] #assign constant to hold the array of notes, this is kept in the yaml file, if the file doesn't exist it will be created.
#would have rathered this be a class instance variable but the refactoring involved wasn't worth it for an app that it didn't effect.
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
  
    def save! #id is set to a random number 1..1000. This avoids ID overlap unless extremely unlucky. Need to find a unique ID creation that lets the user type said id without it being long garbage.
      raise 'Note not saved' unless valid?
      @id = rand(1000)
      TODOS << self
      File.open('todo.yml', 'w') { |file| file.write(TODOS.to_yaml) } #save will push the new note id into the TODOS array and save it in the yaml
    end

    def self.help #user menu option if they are confused
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
  
    def delete #sets ID to nil and then mutates the array removing any nil values. 
      return if @id.nil?
      idx = TODOS.index { |todo| todo.id == @id }
      @id = TODOS[idx] = nil
      TODOS.reject! { |item| item.nil? || item == '' }
      File.open('todo.yml', 'w') { |file| file.write(TODOS.to_yaml) }
    end
  
    def to_s
    end
  
    def self.all
      TODOS
    end
  
    def self.find(id) #iterates through array looking for the argument ID passed in
      id = id.to_i
      todo = TODOS.find { |a| a.id == id }
      raise "Invalid ID number" unless todo
      todo
    end

    def self.fetch_id #helper method to ask for additional input after show, update or delete are entering in main menu
        prompt = TTY::Prompt.new
        prompt.ask("Please enter the ID #") do |q|
          q.validate { |input| input =~ /^\d+$/ }
          q.messages[:valid?] = "Please enter a valid ID #"
        end
    end
end