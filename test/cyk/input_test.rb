require 'minitest/autorun'
require_relative '../../lib/cyk/input'

class InputTest < MiniTest::Unit::TestCase
  def test_parse_grammar_short
    grammar_hash = { :A_B => [:S, :A], :a => [:A], :b => [:A, :B], :B_C => [:B], :c => [:C] }
    assert_equal grammar_hash, Input.read_and_parse('files/sample-input1.txt')
  end

  def test_parse_grammar_long
    grammar_hash = { :B_C=>[:S, :A, :D], :a=>[:S], :b=>[:S, :A, :B], :D_A=>[:B], :c=>[:C], :d=>[:C, :D], :A_C=>[:D], :A_D=>[:D], :C_B=>[:D] }
    assert_equal grammar_hash, Input.read_and_parse('files/sample-input2.txt')
  end
end
