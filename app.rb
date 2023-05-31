require_relative 'book'
require_relative 'label'

books = []
labels = []
@albums = []
@genres = []

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

def list_all_music_albums
  if @albums.empty?
    puts "\nNo Albums to show. Please add some Musid Albums . . . ".magenta
  else
    puts "\nAvailable Music Albums in the list: #{@albums.count} \n".magenta
    @albums.each_with_index do |album, index|
      print "[ #{index + 1} ]:  Music Album: #{album.album_name} | Author: #{album.author.first_name} "
      print "#{album.author.last_name} |  Label: #{album.label.title}  | Archived: #{album.archived} | "
      puts "On Spotify: #{album.on_spotify} | Publication_date: #{album.publish_date} | Genre: #{album.genre.name}"
    end
  end
end

def add_music_album
  print 'Enter the name of the music album: '
  album_name = gets.chomp
  print 'Enter the publish date of the music album e.g (2023-01-11) '
  date = set_valid_date

  album = MusicAlbum.new(nil, album_name, date)

  archive_album(album)

  author = add_author
  author.add_item(album)
  puts "\nAuthor added for the album #{album.album_name} succesfully ".green

  label = add_label
  label.add_item(album)
  puts "\nLabel added for the album #{album.album_name} successfully ".green

  genre = add_genre
  genre.add_item(album)
  puts "\nGenre added for the album #{album.album_name} successfully ".green
end

def get_user_input(prompt, valid_responses)
  while true
    print prompt
    input = gets.chomp
    break if valid_responses.include?(input)

    puts "\nInvalid input. Please enter one of the following: #{valid_responses.join(', ')} \n".red
  end
  input
end

def list_all_genres
  if @genres.empty?
    puts "\nNo Genres to Show Add some genres . . . ".magenta
  else
    puts "\nAvailable Genres in the list : #{@genres.count} \n".magenta
    @genres.each_with_index do |genre, index|
      print "[ #{index + 1} ]: Name: #{genre.name} \n"
    end
  end
end

def create_genre
  print 'Enter the name of the genre: '
  name = gets.chomp
  genre = Genre.new(name)
  @genres << genre
  genre
end
