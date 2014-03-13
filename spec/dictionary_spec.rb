require 'rspec'
require 'Term'
require 'Word'
require 'Definition'


describe 'Term' do
  before { Term.clear }

  describe '#initialize' do
    it 'is initialized as an instance of term' do
      test_term = Term.new('carrot', 'A delicious veggie')
      test_term.should be_an_instance_of Term
    end

    it 'returns the word and definition for a term instance' do
      test_term = Term.new('carrot', 'A delicious veggie')
      test_term.words.should eq ['carrot']
    end
  end

  describe '.create' do
    it 'creates a new term object in the terms array' do
      test_term = Term.create('carrot', 'A delicious veggie', 'english')
      Term.all.should eq [test_term]
    end
  end

  # describe '.search' do
  #   it 'returns the entire object for the searched for term' do
  #     test_term = Term.create('carrot', 'A boring veggie')
  #     Term.search("carrot").should eq [test_term]
  #   end
  # end

  describe '#add_definition' do
    it 'adds a new definition to the term definitions array' do
      test_term = Term.create('carrot', 'A boring veggie', 'english')
      test_term.add_definition('an orange item', 'english')
      test_term.all_definitions[1].definition.should eq 'an orange item'
      test_term.all_definitions[1].language.should eq 'english'
    end
  end

  describe '#add_word' do
    it 'adds a new word to the term word array' do
       test_term = Term.create('carrot','A friendly veggie', 'english')
       test_term.add_word('zanahoria', 'spanish')
       test_term.all_words[1].word.should eq 'zanahoria'
       test_term.all_words[1].language.should eq 'spanish'
    end
  end
end

describe 'Word' do
  describe '#initialize' do
    it 'initializes an instance of word with a word and language' do
      test_word = Word.new('carrot', 'english')
      test_word.should be_an_instance_of Word
    end
  end
end

describe 'Definition' do
  describe '#initialize' do
    it 'initializes an instance of definition with a definition and language' do
      test_definition = Definition.new('carrot', 'english')
      test_definition.should be_an_instance_of Definition
    end
  end
end
