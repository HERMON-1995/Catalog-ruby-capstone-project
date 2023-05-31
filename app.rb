require_relative 'book'
require_relative 'label'

books = []
labels = []

def add_book(books)
  puts 'Enter book publisher:'
  publisher = gets.chomp
  puts 'Enter cover state (good/bad):'
  cover_state = gets.chomp
  book = Book.new(publisher, cover_state)
  books << book
  book
end

def list_books(books)
  puts 'List of all books:'
  books.each do |book|
    puts "Book ID: #{book.id},
      Publisher: #{book.publisher},
      Cover State: #{book.cover_state},
      Archived: #{book.archived}"
  end
end

def add_label(labels)
  puts 'Enter label title:'
  title = gets.chomp
  puts 'Enter label color:'
  color = gets.chomp
  label = Label.new(title, color)
  labels << label
  label
end

def list_labels(labels)
  puts 'Listing all labels:'
  labels.each do |label|
    puts "Label #{label.id}: #{label.title} (#{label.color})"
  end
end

loop do
  puts 'Enter an option:'
  puts '1. Add a book'
  puts '2. List all books'
  puts '3. Add a label'
  puts '4. List all labels'
  puts '5. Exit'
  choice = gets.chomp.downcase

  case choice
  when '1'
    add_book(books)
    puts 'Book Added successfully'
  when '2'
    list_books(books)
  when '3'
    add_label(labels)
    puts 'Label Added successfully'
  when '4'
    list_labels(labels)
  when '5'
    break
  else
    puts 'Invalid choice. Please try again.'
  end
end
