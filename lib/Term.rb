require './lib/Word'
require './lib/Definition'

class Term
  attr_reader :words, :definitions

  @@terms = []

  def initialize(word, definition)
    @words = [word]
    @definitions = [definition]
  end

  def Term.create(word, definition, language)
    new_word = Word.new(word, language)
    new_definition = Definition.new(definition, language)
    new_term = Term.new(new_word, new_definition)
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

  def add_definition(definition, language)
    @definitions << Definition.new(definition, language)
  end

  def all_definitions
    @definitions
  end

  def add_word(word, language)
    @words << Word.new(word, language)
  end

  def all_words
    @words
  end

  def Term.clear
    @@terms = []
  end

end
