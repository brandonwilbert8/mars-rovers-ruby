$max_x, $max_y = nil, nil

class Rover
  def initialize(x, y, orientation)
    @x = x
    @y = y
    @orientation = orientation
  end

  # Methods to move forward
  def move_forward
    case @orientation
    when "N"
      @y += 1
    when "E"
      @x += 1
    when "S"
      @y -= 1
    when "W"
      @x -= 1
    end
  end

  # Methods to move left - turning 90 degrees to the left
  def turn_left
    @orientation = case @orientation
                   when "N"
                     "W"
                   when "E"
                     "N"
                   when "S"
                     "E"
                   when "W"
                     "S"
                   end
  end

  # Methods to move right - turning 90 degrees to the right
  def turn_right
    @orientation = case @orientation
                   when "N"
                     "E"
                   when "E"
                     "S"
                   when "S"
                     "W"
                   when "W"
                     "N"
                   end
  end

  # Method to execute a list of commands, given by NASA from Earth to execute the plateau - M, L, and R
  # M: Move Forward
  # L: Spin Left
  # R: Spin Right
  def execute_commands(commands)
    commands.each_char do |command|
      case command
      when "M"
        move_forward
      when "L"
        turn_left
      when "R"
        turn_right
      end
    end

    # Range checking for X and Y
    @x = [@x, 0].max
    @x = [@x, $max_x].min if $max_x
    @y = [@y, 0].max
    @y = [@y, $max_y].min if $max_y
  end

  # Printing the current position
  def print_position
    puts "#{@x} #{@y} #{@orientation}"
  end
end

# Function to parse the input and create rovers
def create_rovers(input)
  lines = input.split("\n")

  # Assigning the first element as maximum values - in this case: 5 and 5
  $max_x, $max_y = lines[0].split(" ").map(&:to_i)

  rovers = []

  # Input looping
  (1...lines.length).step(2) do |i|
    # Variables assignments
    x, y, orientation = lines[i].split(" ")

    # Assigning commands
    commands = lines[i + 1]

    # Creating the rover object based on the input
    rover = Rover.new(x.to_i, y.to_i, orientation)

    # Calling the execute_commands() method to execute the command
    rover.execute_commands(commands)

    # Pushing the output into the empty array
    rovers << rover
  end

  # Returning the array
  rovers
end

# Main function to run the program
def run_program(input)
  # Instantiate a new instance of the create_rovers() function by passing the input as a parameter
  rovers = create_rovers(input)

  # Print out the results based on each element of the array
  rovers.each(&:print_position)
end

# Example input
input = <<~INPUT
  5 5
  1 2 N
  LMLMLMLMM
  3 3 E
  MMRMMRMRRM
INPUT

# Program execution
run_program(input)
