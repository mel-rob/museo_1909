require_relative './file_io'

artist_path = './data/artists.csv'
photograph_path = './data/photographs.csv'

locations = {
  artists: artist_path,
  photographs: photograph_path
}

file_io = FileIO.from_csv(locations)

require 'pry'; binding.pry
