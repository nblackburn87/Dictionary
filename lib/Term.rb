class Term
  attr_reader :words, :definitions

  @@terms = []

  def initialize(word, definition)
    @words = [word]
    @definitions = [definition]
  end

  def Term.create(word, definition)
    new_term = Term.new(word, definition)
    @@terms << new_term
    new_term
  end
  #search only works with word as a property. Multi-language support currently breaks search
  # def Term.search(word)
  #   @@terms.select do |term|
  #     term.word == word
  #   end
  # end

  def Term.all
    @@terms
  end

  def add_definition(definition)
    @definitions << definition
  end

  def all_definitions
    @definitions
  end

  def add_word(word)
    @words << word
  end

  def all_words
    @words
  end

  def Term.clear
    @@terms = []
  end

end
