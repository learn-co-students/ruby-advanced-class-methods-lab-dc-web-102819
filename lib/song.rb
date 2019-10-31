require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create()
    new_song = Song.new
    @@all << new_song
    new_song
  end

  def self.all
    @@all
  end

  def self.save
    self.all << self
  end

  def self.new_by_name(song_title, artist_name="unknown")
    new_song = self.create
    new_song.name = song_title
    new_song.artist_name = artist_name
    new_song
  end

  def self.create_by_name(song_title, artist_name="unknown")
    self.new_by_name(song_title, artist_name)
  end

  def self.find_by_name(song_title)
    #grab array all Songs
    #iterate through array to select matching name
    @@all.find { | song | song.name == song_title}
  end

  def self.find_or_create_by_name(song_title, artist_name="unknown")
    if self.find_by_name(song_title)
      self.find_by_name(song_title)
    else
      self.create_by_name(song_title, artist_name)
    end
  end

  def self.alphabetical
    @@all.sort_by { | song | song.name }
  end

  def self.new_from_filename(filename)
    #filename format: "artist_name - song_name.mp3"
    filedata = filename.chop.chop.chop.chop.split(" - ")
    artist = filedata[0]
    name = filedata[1]

    self.find_or_create_by_name(name, artist)
  end

  def self.create_from_filename(filedata)
    self.new_from_filename(filedata)
    self.save
  end

  def self.destroy_all
    @@all.clear
  end

end
