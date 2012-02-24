require 'minitest/autorun'
require_relative '../lib/cyk'

class CykTest < MiniTest::Unit::TestCase
  def test_sample_1_short_success
    file = "files/sample-input1.txt"
    string = "abbbbc"
    assert_equal true, Cyk.can_generate(string, file)
  end

  def test_sample_1_short_failure
    file = "files/sample-input1.txt"
    string = "abcaa"
    assert_equal false, Cyk.can_generate(string, file)
  end

  def test_sample_1_long_success
    file = "files/sample-input1.txt"
    string = "abbbbbbbbbbbbbbbbbbbbbbbbbbbbccccccccccccccccc"
    assert_equal true, Cyk.can_generate(string, file)
  end

  def test_sample_1_long_failure
    file = "files/sample-input1.txt"
    string = "abbbbbbbbbbbbbbbbsbbbbbbbbbbbbccccccccccccccccc"
    assert_equal false, Cyk.can_generate(string, file)
  end

  def test_sample_2_short_success
    file = "files/sample-input2.txt"
    string = "a"
    assert_equal true, Cyk.can_generate(string, file)
  end

  def test_sample_2_short_failure
    file = "files/sample-input2.txt"
    string = "c"
    assert_equal false, Cyk.can_generate(string, file)
  end

  def test_sample_2_long_success
    file = "files/sample-input2.txt"
    string = "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbdbccbcc"
    assert_equal true, Cyk.can_generate(string, file)
  end

  def test_sample_2_long_failure
    file = "files/sample-input2.txt"
    string = "abbbbbbbbbbbbbbbbsbbbbbbbbbbbbccccccccccccccccc"
    assert_equal false, Cyk.can_generate(string, file)
  end
end
