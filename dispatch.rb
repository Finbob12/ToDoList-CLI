require_relative 'controllers/notes_controller.rb'

def dispatch(selection)
  case selection
  when 'new'
    ::NotesController.new
  when 'list'
    ::NotesController.index
  when 'show'
    ::NotesController.show
  when 'update'
    ::NotesController.update
  when 'help'
    ::NotesController.help
  when 'delete'
    ::NotesController.delete
  end
end