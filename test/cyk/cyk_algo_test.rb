require 'minitest/autorun'
require_relative '../../lib/cyk/cyk_algo'

class CykAlgoTest < MiniTest::Unit::TestCase
  def test_success_short_string
    grammar_hash = { :A_B => [:S, :A], :a => [:A], :b => [:A, :B], :B_C => [:B], :c => [:C] }
    string = "abbbbbc"
    assert_equal true, CykAlgo.cyk_algo(string, grammar_hash)
  end

  def test_success_long_string
    grammar_hash = { :X_Y => [:S], :X_A => [:X], :a => [:X, :Y, :A], :b => [:X], :A_Y => [:Y] }
    string = "baaaaaaaaaaaaaaaaaaaa"
    assert_equal true, CykAlgo.cyk_algo(string, grammar_hash)
  end

  def test_failure_short_string
    grammar_hash = { :X_Y => [:S], :X_A => [:X], :a => [:X, :Y, :A], :b => [:X], :A_Y => [:Y] }
    string = "babaa"
    assert_equal false, CykAlgo.cyk_algo(string, grammar_hash)
  end

  def test_failure_long_string
    grammar_hash = { :X_Y => [:S], :X_A => [:X], :a => [:X, :Y, :A], :b => [:X], :A_Y => [:Y] }
    string = "babaaaaaaaaaaaaaaaaaaaa"
    assert_equal false, CykAlgo.cyk_algo(string, grammar_hash)
  end

  def test_fail_when_char_not_in_grammar
    grammar_hash = { :X_Y => [:S], :X_A => [:X], :a => [:X, :Y, :A], :b => [:X], :A_Y => [:Y] }
    string = "zyxa"
    assert_equal false, CykAlgo.cyk_algo(string, grammar_hash)
  end

end
