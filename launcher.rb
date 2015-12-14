require_relative 'lib/printer'
require_relative 'lib/turing_machine'
Dir["programs/*.rb"].each {|file| require_relative file }
require 'pry-byebug'

@tape = [1,1,1,1,1,0,1,1,0]
@program = SubstractTwoNumbers


TuringMachine.new(tape: @tape, program: @program).run
