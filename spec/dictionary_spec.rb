require 'rspec'
require 'Term'

describe 'Term' do
  before { Term.clear }

  describe '#initialize' do
    it 'is initialized as an instance of term' do
      test_term = Term.new('carrot', 'A delicious veggie')
      test_term.should be_an_instance_of Term
    end

    it 'returns the word and definition for a term instance' do
      test_term = Term.new('carrot', 'A delicious veggie')
      test_term.word.should eq 'carrot'
      test_term.definition.should eq 'A delicious veggie'
    end
  end

  describe '.create' do
    it 'creates a new term object in the terms array' do
      test_term = Term.create('carrot', 'A delicious veggie')
      Term.all.should eq [test_term]
    end
  end

  describe '.search' do
    it 'returns the entire object for the searched for term' do
      test_term = Term.create('carrot', 'A boring veggie')
      Term.search("carrot").should eq [test_term]
    end
  end
end
