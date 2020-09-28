require_relative 'todo'

class Note < Todo
  DIFFICULTY_RANGE = 1..5
  DIFFICULTY_ERROR_MESSAGE = \
    "Difficulty must be between #{DIFFICULTY_RANGE.first} and #{DIFFICULTY_RANGE.last}"

  def contents=(contents)
    super
    if valid_contents?
      errors.delete(:contents)
    else
      errors[:contents] = DIFFICULTY_ERROR_MESSAGE
    end
  end
  
  def valid_contents?
    DIFFICULTY_RANGE === @contents
  end

  def valid?
    super && valid_contents?
  end
end