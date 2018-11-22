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
    @@all << new_song
    new_song
  end

  def self.new_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    new_song
  end

  def self.create_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    @@all << new_song
    new_song
  end

  def self.find_by_name(song_name)
    self.all.each do |song|
      if song.name == song_name
        return song
      end
    end
    return nil
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) ? self.find_by_name(song_name) : self.create_by_name(song_name)
  end

  def self.alphabetical
    a_to_z = self.all.sort do |a,b|
      a.name <=> b.name
    end
    a_to_z
  end

  def self.new_from_filename(file_name)
    split_name = file_name.chomp(".mp3").split(" - ")
    new_song = self.new
    new_song.name = split_name[1]
    new_song.artist_name = split_name[0]
    new_song
  end

  def self.create_from_filename(file_name)
    split_name = file_name.chomp(".mp3").split(" - ")
    new_song = self.new
    new_song.name = split_name[1]
    new_song.artist_name = split_name[0]
    @@all << new_song
    new_song
  end

  def self.destroy_all
    @@all.clear
  end
  
end
