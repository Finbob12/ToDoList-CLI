require_relative 'todo'

class Note < Todo
  CONTENTS_DEFINITION = String
  CONTENTS_ERROR_MESSAGE = \
    "Contents must be a string!"

  def contents=(contents)
    super
    if valid_contents?
      errors.delete(:contents)
    else
      errors[:contents] = CONTENTS_ERROR_MESSAGE
    end
  end
  
  def valid_contents?
    CONTENTS_DEFINITION === @contents
  end

  def valid?
    super && valid_contents?
  end
end