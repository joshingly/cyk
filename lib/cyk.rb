require_relative 'cyk/cyk_algo'
require_relative 'cyk/input'

class Cyk

  def self.can_generate string, grammar_file
    grammar_hash = Input.read_and_parse(grammar_file)

    return true if CykAlgo.cyk_algo(string, grammar_hash)
    false
  end
end
