# Possible instance variables
head_position = 3
tape = [0,0,1,0,1,1,0]
state = 8
@positions_to_show = 6

def left_zeros
  (@positions_to_show - @written_belt.size) / 2
end
# puts build_head(7)
# require 'pry-byebug'; binding.pry
# puts join_ascii_outputs([print_tape(tape),print_tape(tape)])
puts print_machine(tape,state, head_position)
