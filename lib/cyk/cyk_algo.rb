module CykAlgo
  extend self

  def cyk_algo(string, grammar_hash)
    table = Hash.new(Array.new)
    string = string.scan(/./)
    diagonal = []
    length = string.length

    string.each_with_index do |char, i|
      row = i
      column = (string.length  - 1) - i

      table[[row,column]] = grammar_hash[char.to_sym] if grammar_hash[char.to_sym]

      diagonal << [row, column]
    end

    table = fill_table(diagonal, table, length, grammar_hash)

    return false if table[[0,0]].index(:S) == nil

    true
  end

  private

  def fill_table(diagonal, table, length, grammar_hash)
    until diagonal.length == 0
      next_diagonal = []

      diagonal.each do |cell|
        unless cell.last - 1 < 0
          new_cell = [cell.first, cell.last - 1]
          next_diagonal << new_cell
          table[new_cell] = calculate_new_cell(new_cell, table, length, grammar_hash)
        end
      end

      diagonal = next_diagonal
    end

    table
  end

  def calculate_new_cell(cell, table, length, grammar_hash)
    highest = (length - 1) - cell.last
    cell_contents = []

    (highest - cell.first).times do |i|
      cell_top = [highest - i, cell.last]
      cell_right = [cell.first, cell.last + i + 1]
      cell_contents += concatenate_cells(table[cell_right], table[cell_top], grammar_hash)
      cell_contents.uniq!
    end

    cell_contents
  end

  def concatenate_cells (cell_right, cell_top, grammar_hash)
    concatenation = []

    unless cell_right.length == 0 || cell_top.length == 0
      cell_right.each do |right_rule|
        cell_top.each do |top_rule|
          rule = [right_rule, top_rule]

          concatenation += grammar_hash[rule.join('_').to_sym] if grammar_hash[rule.join('_').to_sym]
        end
      end
    end

    concatenation
  end
end
