class Curator

  attr_reader :photographs, :artists

  def initialize
    @photographs = []
    @artists = []
  end

  def add_photograph(photograph)
    @photographs << photograph
  end

  def add_artist(artist)
    @artists << artist
  end

  def find_artist_by_id(id)
    @artists.find do |artist|
      artist.id == id
    end
  end

  def find_photograph_by_id(id)
    @photographs.find do |photograph|
      photograph.id == id
    end
  end

  def find_photographs_by_artist(artist)
    @photographs.find_all do |photograph|
      photograph.artist_id == artist.id
    end
  end

  def artists_with_multiple_photographs
    multiples = []
    @artists.each do |artist|
      photos = find_photographs_by_artist(artist)
      if photos.count > 1
        multiples << artist
      end
    end
    multiples
  end

  def photographs_taken_by_artist_from(country)
    all_photos = []
    @artists.each do |artist|
      if artist.country == country
      photos = find_photographs_by_artist(artist)
      all_photos << photos
      end
    end
    all_photos.flatten
  end





















end
