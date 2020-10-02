
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
      raise 'Note not saved' unless valid?
      @id = rand(100)
      TODOS << self
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
      return if @id.nil?
      idx = TODOS.index { |todo| todo.id == @id }
      @id = TODOS[idx] = nil
      TODOS.reject! { |item| item.nil? || item == '' }
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
        prompt = TTY::Prompt.new
        prompt.ask("Please enter the ID #") do |q|
          q.validate { |input| input =~ /\A[+-]?\d+(\.\d+)?\z/ }
          q.messages[:valid?] = "Please enter a valid ID #"

        end
    end
end