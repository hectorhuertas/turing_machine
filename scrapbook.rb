require_relative 'lib/printer'
require 'pry-byebug'
# Possible instance variables
@head_position = 0
@tape = [1,1,1,0,1,1,0]
@state = 0
@positions_to_show = 6

def left_zeros
  (@positions_to_show - @written_belt.size) / 2
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

def ST
  @halt = true
end

def run
  while @halt.nil?
    Printer.print_machine(@tape,@state, @head_position)
    reading = @tape[@head_position]
    send(@programa[@state][reading][0])
    @state = @programa[@state][reading][1]
  end
end

@programa=[
  [ [ :_1, 1], [ :_R, 0] ],
  [ [ :_L, 2], [ :_R, 1] ],
  [ [ :ST, 0], [ :_0, 2] ]
]
run
# puts build_head(7)
# require 'pry-byebug'; binding.pry
# puts join_ascii_outputs([print_tape(tape),print_tape(tape)])
Printer.print_machine(@tape,@state, @head_position)
