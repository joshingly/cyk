# author: Joshua Antonishen

# accepts input of the form S -> A B
#                           A -> A B | a | b
#                           B -> B C | b
#                           C -> c
# parses input into a hash of the form...
# underscores are used to separate production rules (and/or terminals) in the keys
# {:A_B => [:A], :a => [:A], :b => [:A, :B], etc...}

module Input
  extend self

  def read_and_parse(file_path)
    all_lines = read_lines(file_path)
    parse_input(all_lines)
  end

  private

  def read_lines(file_path)
    all_lines = []

    File.open(file_path, "r") do |file|
      all_lines = file.readlines
    end

    all_lines.each{ |line| line.chomp! }

    all_lines
  end

  def parse_input(all_lines)
    hash_of_grammar = Hash.new(false)

    all_lines.each do |line|
      pieces = line.split(/ -> /)

      rule_name = pieces.first
      production_rules = parse_rule(pieces[1])

      production_rules.each do |key|
        unless hash_of_grammar[key.to_sym]
          hash_of_grammar[key.to_sym] = [rule_name.to_sym]
        else
          hash_of_grammar[key.to_sym] << rule_name.to_sym
        end
      end
    end

    hash_of_grammar
  end

  def parse_rule(rule_string)
    production_rule = rule_string.split(/ \| /)
    rules_as_hash_keys = []

    production_rule.each do |rule_content|
      value = ""

      if / / =~ rule_content
        rule_pieces = rule_content.split(/ /)

        value << rule_pieces.first
        rule_pieces[1...rule_pieces.length].each{ |rule| value << "_#{ rule }" }
      else
        value = rule_content
      end

      rules_as_hash_keys << value
    end

    rules_as_hash_keys
  end
end
