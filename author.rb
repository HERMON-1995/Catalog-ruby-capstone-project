class Genre
    attr_reader :id
    attr_accessor :name, :items
  
    def initialize(name, id: nil)
      @id = id.nil? ? generate_id : id
      @name = name
      @items = []
    end
  
    def add_item(item)
      @items << item
      item.genre = self
    end
end  