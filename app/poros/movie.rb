class Movie
  CastMember = Struct.new(:id, :name, :character)
  Review = Struct.new(:author, :content)

  attr_reader :title,
              :score,
              :id

  def initialize(attributes)
    @id = attributes[:id]
    @title = attributes[:title]
    @score = attributes[:vote_average]
    @genres = set_genres(attributes[:genres])
    @runtime = set_runtime(attributes[:runtime])
    @summary = attributes[:overview]
    @tagline = attributes[:tagline]
    @top_cast = set_top_cast(attributes[:cast])
    @review = set_reviews(attributes[:reviews])
  end

  def set_genres(genre_array)
    genre_array.map do |genre|
      genre[:name]
    end
  end

  def set_runtime(runtime)
    hours = runtime / 60
    minutes = runtime % 60
    "#{hours}h #{minutes}m"
  end

  def set_top_cast(total_cast)
    total_cast.first(10).map do |cast_member|
      CastMember.new(cast_member[:id], cast_member[:name], cast_member[:character])
    end
  end

  def set_reviews(review_list)
    results = review_list[:results]
    results.map do |review|
      Review.new(review[:author], review[:content])
    end
  end
end
