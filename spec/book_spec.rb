require_relative '../book'

RSpec.describe Book do
  let(:book) { Book.new('The Review and Herald', 'Best') }

  describe '#new' do
    it 'Should create a new book object' do
      expect(book).to be_an_instance_of Book
    end
  end
  describe '#Item_kind' do
    it 'Should be a kind of Item' do
      expect(book).to be_kind_of Item
    end
  end
  describe '#publisher' do
    it 'Should return the publisher to be The Review and Herald' do
      expect(book.publisher).to eq 'The Review and Herald'
    end
  end
  describe '#cover_state' do
    it 'Should return the cover state to be best' do
      expect(book.cover_state).to eq 'Best'
    end
  end

  describe '#can_be_archived?' do
    context 'when the book cover state is "bad"' do
      before do
        allow(book).to receive(:super).and_return(false)
        book.cover_state = 'bad'
      end

      it 'returns true' do
        expect(book.can_be_archived?).to be true
      end
    end

    context 'when the book is not archived and the cover state is not "bad"' do
      before do
        allow(book).to receive(:super).and_return(false)
        book.cover_state = 'good'
      end

      it 'returns false' do
        expect(book.can_be_archived?).to be false
      end
    end
  end

  describe '#to_h' do
    let(:expected_hash) do
      {
        id: book.id,
        publisher: book.publisher,
        cover_state: book.cover_state,
        genre: nil,
        author: nil,
        source: nil,
        label: nil,
        publish_date: nil,
        archived: false
      }
    end

    it 'returns a hash representation of the book' do
      expect(book.to_h).to eq expected_hash
    end
  end
end
