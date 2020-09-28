require_relative 'controllers/notes_controller.rb'

def dispatch(cmd, params = nil)
  case cmd
  when 'list'
    ::NotesController.index
  when 'show'
    ::NotesController.show params
  when 'new'
    ::NotesController.new
  when 'update'
    ::NotesController.update params
  when 'delete'
    ::NotesController.destroy params
  end
end
