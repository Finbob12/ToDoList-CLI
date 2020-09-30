require_relative 'controllers/notes_controller.rb'

def dispatch(cmd, id = nil)
  case cmd
  when 'new'
    ::NotesController.new
  when 'list'
    ::NotesController.index
  when 'show'
    ::NotesController.show(id)
  when 'update'
    ::NotesController.update(id)
  when 'delete'
    ::NotesController.delete(id)
  end
end