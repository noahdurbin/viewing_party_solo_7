class movie
  attr_reader :title,
              :score,
              :id

  def initialize(attributes)
    @id = attributes[:id]
    @title = attributes[:title]
    @score = attributes[:vote_average]
  end
end
