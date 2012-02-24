require_relative 'cyk/cyk_algo'
require_relative 'cyk/input'

class Cyk

  def self.can_generate string, grammar_file
    grammar_hash = Input.read_and_parse(grammar_file)

    if CykAlgo.cyk_algo(string, grammar_hash)
      return true
    else
      return false
    end
  end
end
