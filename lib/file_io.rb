require 'csv'
require './lib/artist'
require './lib/curator'
require './lib/photograph'
require './lib/photograph_collection'
require './lib/artist_collection'

class FileIO
  attr_reader :artists, :photographs

  def initialize(artists, photographs)
    @artists = artists
    @photographs = photographs
  end

  def self.from_csv(location_paths)
  artist_data = ArtistCollection.new(generate_artist_collection(location_paths[:artists]))
  photograph_data = PhotographCollection.new.(generate_photograph_collection(location_paths[:photographs]))
  self.new(artist_data, photograph_data)
  end

  def self.generate_artist_collection(file_path)
    artist_array = []
    CSV.foreach(file_path, headers: :first_row) do |csv_row|
      artist_array << Artist.new(csv_row)
    end
    artist_array
  end

  def self.generate_photograph_collection(file_path)
    photograph_array = []
    CSV.foreach(file_path, headers: :first_row) do |csv_row|
      photograph_array << Photograph.new(csv_row)
    end
    photograph_array
  end
end
