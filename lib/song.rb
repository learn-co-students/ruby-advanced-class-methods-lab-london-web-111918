require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

def self.create
  new_song = Song.new
  new_song.save
  new_song
end

def self.new_by_name(song_name)
  new_song = self.new
  new_song.name = song_name
  new_song
end

def self.create_by_name(song_name)
  new_song = self.create
  new_song.name = song_name
  new_song
end

def self.find_by_name(song_name)
  @@all.find { |song| song.name == song_name}
end

def self.find_or_create_by_name(song_name)
  if self.find_by_name(song_name)
     return find_by_name(song_name)
    else
      self.create_by_name(song_name)
  end
end

def self.alphabetical
if self.all.length != 0
  self.all.sort_by {|song| song.name}
end
end

def self.new_from_filename(filename)
  file_array = filename.split(" - ")
  artist_name = file_array[0]
  name = file_array[1].split(".")[0]

  song = Song.new
  song.name = name
  song.artist_name = artist_name
  song
  end

def self.create_from_filename(filename)
  new_song = self.new_from_filename(filename)
  new_song.save
  new_song
end

def self.destroy_all
@@all = []
@@all
end
end
#binding.pry
0
