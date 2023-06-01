require_relative 'item'

class Book < Item
  attr_reader :id
  attr_accessor :publisher, :cover_state, :author

  def initialize(publisher, cover_state, author)
    @id = Random.rand(1..1000)
    super()
    @publisher = publisher
    @cover_state = cover_state
    @author = author
  end

  def can_be_archived?
    @archived = if super or @cover_state == 'bad'
                  true
                else
                  false
                end
  end

  def display author
    "#{author.first_name} #{author.last_name}"
  end

  def to_h
    {
      id: @id,
      publisher: @publisher,
      cover_state: @cover_state,
      genre: @genre,
      author: @author.to_h,
      source: @source,
      label: @label&.to_h,
      publish_date: @publish_date,
      archived: @archived
    }
  end
end
