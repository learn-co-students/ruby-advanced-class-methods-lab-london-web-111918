require 'pry'
class Song
  attr_accessor :name, :artist_name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
  song = Song.new("sample")
  song
  end

  def self.new_by_name(string)
  song = Song.new(string)
  song
  end

  def self.create_by_name(name)
    song = Song.new(name)
    @song = song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def Song.find_or_create_by_name(name)
    if Song.find_by_name(name)
      return Song.find_by_name(name)
    else
      Song.create_by_name(name)
    end
  end

  def self.alphabetical
  @@all.sort_by { |song| song.name }
  end


  def self.destroy_all
    @@all.clear
  end

  end
