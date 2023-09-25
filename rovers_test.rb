require_relative 'rovers'

describe Rover do
  describe '#initialize' do
    it 'initializes a Rover with correct coordinates and orientation' do
      rover = Rover.new(1, 2, 'N')
      expect(rover.instance_variable_get(:@x)).to eq(1)
      expect(rover.instance_variable_get(:@y)).to eq(2)
      expect(rover.instance_variable_get(:@orientation)).to eq('N')
    end
  end

  describe '#move_forward' do
    it 'moves the Rover forward in the correct direction' do
      rover = Rover.new(1, 2, 'N')
      rover.move_forward
      expect(rover.instance_variable_get(:@x)).to eq(1)
      expect(rover.instance_variable_get(:@y)).to eq(3)
    end
  end

  describe '#turn_left' do
    it 'turns the Rover left 90 degrees' do
      rover = Rover.new(1, 2, 'N')
      rover.turn_left
      expect(rover.instance_variable_get(:@orientation)).to eq('W')
    end
  end

  describe '#turn_right' do
    it 'turns the Rover right 90 degrees' do
      rover = Rover.new(1, 2, 'N')
      rover.turn_right
      expect(rover.instance_variable_get(:@orientation)).to eq('E')
    end
  end

  describe '#execute_commands' do
    it 'executes a list of commands correctly' do
      rover = Rover.new(1, 2, 'N')
      rover.execute_commands('LMLMLMLMM')
      expect(rover.instance_variable_get(:@x)).to eq(1)
      expect(rover.instance_variable_get(:@y)).to eq(3)
      expect(rover.instance_variable_get(:@orientation)).to eq('N')
    end
  end

  describe '#print_position' do
    it 'prints the current position of the Rover' do
      rover = Rover.new(1, 2, 'N')
      expect { rover.print_position }.to output("1 2 N\n").to_stdout
    end
  end
end
