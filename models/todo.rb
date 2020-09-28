class Todo
    # Since a constant is a global across the entire application, all subclasses
    # of todo will use the same array. Consider refactoring this data
    # structure to an class instance variable.
    TODOS = []
  
    attr_reader :id, :errors, :contents
    attr_accessor :heading
  
    def initialize(heading: nil, contents: nil)
      @id = nil
      @heading = heading
      @contents = contents.to_i
      @errors = {}
    end
  
    # We want to coelesce contents to always be an integer; use attr_reader
    # to be able to read contents, but write a custom setter method so that
    # we have control over the assignment to the @contents instance variable.
    def contents=(contents)
      @contents = contents.to_i
    end
  
    def valid?
      true
    end
  
    def save!
      raise 'RecordNotSaved' unless valid?
  
      @id = TODOS.length + 1
      TODOS << self
    end
  
    def delete
      idx = TODOS.index { |todo| todo.id == @id }
  
      # Set the todo to nil in the TODOS array, effectively deleting
      # it. Also set @id to nil to flag that this todo instance is no
      # longer persisted.
      @id = TODOS[idx] = nil
  
      # Ids may be reused if we compact the array. Think up another way to
      # generate unique ids as well as be able to compact the array.
      # TODOS.compact!
    end
  
    def to_s
      [
        super,
        "Id:#{@id} Heading:#{@heading} Contents:#{@contents}"
      ].join("\n")
    end
  
    # Encapsulate access to all assembles; but since we're leaking out the
    # array, it's possible that it gets mutated behind our back...
    def self.all
      TODOS
    end
  
    def self.find(id)
      id = id.to_i
      todo = TODOS.find { |a| a.id == id }
      raise 'RecordNotFound' unless todo
      todo
    end
  end
  