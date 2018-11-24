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


  def self.create #custom constructor
   song = self.new
   song.save
   song
  end

  def self.new_by_name(song_name) #custom constructor
    song = self.new
  	song.name = song_name
  	song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save
    song
  end

  #find a song present in a class variable @@all
  # Who is the responsible for finding the song? The class Song method
  def self.find_by_name(song_name)
    @@all.detect {|song| song.name == song_name}
  end


  # find song by name. If not found then create by name.
  # The class method is responsible for finding the song or creating a new instance.
  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  # return an a sorted array of all songs
  # This is the reponsibility of a class method
  def self.alphabetical
    self.all.sort_by {|song| song.name }
  end

  #parse a filename and create a song with song and artist attributes
  # This is the responsibility of the class method.
  # Need to create a artist_name attr_accessor
  def self.new_from_filename(filename)
    song_info = filename.chomp(".mp3").split(" ")
    song_title = song_info[2..-1].join(" ")
    song = self.create_by_name(song_title)
    song.artist_name = song_info[0]
    song
  end

  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
