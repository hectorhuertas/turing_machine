class TuringMachine
  def initialize(options)
    @program       = options.fetch(:program).load
    @tape          = options.fetch(:tape)
    @state         = options[:state] || 0
    @head_position = options[:head_position] || 0
    @step          = 0
  end

  def run
    print_machine

    while !@halt
      @step += 1
      execute_program
      print_machine
    end
  end

  def execute_program
    operation, state = read_program
    execute(operation)
    update(state)
  end

  def read_program
    [ operation, state ]
  end

  def operation
    @program[@state][tile_value][0]
  end

  def state
    @program[@state][tile_value][1]
  end

  def tile_value
    @tape[@head_position] || 0
  end

  def execute(operation)
    send(operation)
  end

  def update(state)
    @state = state
  end

  def _L
    @head_position -= 1
  end

  def _R
    @head_position += 1
  end

  def _0
    @tape[@head_position] = 0
  end

  def _1
    @tape[@head_position] = 1
  end

  def XX
    @halt = true
  end

  def print_machine
    puts "\nStep: #{@step}"
    Printer.print_machine(@tape,@state, @head_position)
  end
end
