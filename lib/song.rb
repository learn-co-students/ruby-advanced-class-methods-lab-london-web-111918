class Song
  attr_accessor :name, :artist_name
  @@all = []

  def save
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.name
    @@name
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name) #custom constructor
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    self.create_by_name(name)
    self.find_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename) #Thundercat - For Love I Come.mp3
    array = filename.split(' - ') #["Thundercat ", " For Love I Come.mp3"]
    artist_name = array[0]
    array_2 = array[1].split('.')
    name = array_2[0]
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    @@all.clear
  end

end
