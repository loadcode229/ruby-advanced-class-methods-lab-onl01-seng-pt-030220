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
    song = self.new
    self.all << song
    song
  end
  
  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end
  
  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end
  
  def self.find_by_name(song_name)
    result = self.all.find{|song| song.name == song_name}
    result
  end
  
  def self.find_or_create_by_name(song_name)
    result = self.find_by_name(song_name)
    if result
      result
    else
      self.create_by_name(song_name)
    end
  end
  
  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end
  
  def self.new_from_filename(filename)
    songs = filename.split(" - ")
    songs[1] = songs[1].chomp(".mp3")
    
  end
  
  def self.create_from_filename(filname)
    
  end
  
  def self.destroy_all
    @@all.clear
  end
end
