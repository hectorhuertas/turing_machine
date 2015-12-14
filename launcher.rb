require_relative 'lib/printer'
require_relative 'lib/turing_machine'
Dir["programs/*.rb"].each {|file| require_relative file }
require 'pry-byebug'

program = ARGV[0] || 'SubstractTwoNumbers'
tape    = ARGV[1] || [1,1,1,1,1,0,1,1,0]


TuringMachine.new(tape: tape, program: Object.const_get(program)).run
