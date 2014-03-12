class Term
  attr_reader :word, :definition

  @@terms = []

  def initialize(word, definition)
    @word = word
    @definition = definition
  end

  def Term.create(word, definition)
    new_term = Term.new(word, definition)
    @@terms << new_term
    new_term
  end

  def Term.search(word)
    @@terms.select do |term|
      term.word == word
    end
  end

  def Term.all
    @@terms
  end

  def set_definition(definition)
    @definition = definition
  end

  def Term.clear
    @@terms = []
  end

end
