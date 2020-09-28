class Todo
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
    end
  
    def delete
      idx = TODOS.index { |todo| todo.id == @id }
      @id = TODOS[idx] = nil
    end
  
    def to_s
      [
        super,
        "Id:#{@id} Heading:#{@heading} Contents:#{@contents}"
      ].join("\n")
    end
  
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
  