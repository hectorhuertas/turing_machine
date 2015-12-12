module Printer
  def self.print_machine(tape, state, position)
    puts [
      build_positioned_head(state,position),
      print_tape(tape)
    ]
  end

  def self.print_tape(tape) # => tape is an array of numbers
    ascii_tape=["","",""]
    tape.each do |number|
      ascii_tape = add_split(ascii_tape)
      ascii_tape = add_number(ascii_tape,number)
    end
    add_split(ascii_tape)
  end

  def self.add_number(ascii_tape,number)
    [ascii_tape[0] + "-",ascii_tape[1] + "#{number}", ascii_tape[2] + "-"]
  end

  def self.add_split(ascii_tape)
    split = ["-+-"," | ","-+-"]
    [ascii_tape[0]+ split[0],ascii_tape[1] + split[1], ascii_tape[2] + split[2]]
  end

  def self.join_ascii_outputs(array_of_inputs)
    if array_of_inputs.size == 3
      line_1 = array_of_inputs.reduce("") do |result,input|
        result + input[0]
      end
      line_2 = array_of_inputs.reduce("") do |result,input|
        result + input[1]
      end
      line_3 = array_of_inputs.reduce("") do |result,input|
        result + input[2]
      end
      line_1 + "\n" + line_2 + "\n" + line_3
    else
      line_1 = array_of_inputs.reduce("") do |result,input|
        result + input[0]
      end
      line_2 = array_of_inputs.reduce("") do |result,input|
        result + input[1]
      end
      line_3 = array_of_inputs.reduce("") do |result,input|
        result + input[2]
      end
      line_4 = array_of_inputs.reduce("") do |result,input|
        result + input[3]
      end
      line_1 + "\n" + line_2 + "\n" + line_3 + "\n" + line_4
    end
  end

  def self.build_head(state)
    ["+---+", "| #{state} |", "+---+", " \\ /"]
  end

  def self.build_positioned_head(state,position)
    join_ascii_outputs([build_offset(position),build_head(state)])
    # build_head(state)
  end

  def self.build_offset(position)
    offset = " " + " " * 4 * position
    [offset,offset,offset,offset]
  end

end
