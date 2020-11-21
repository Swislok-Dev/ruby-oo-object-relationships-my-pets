
class Owner
  attr_reader :name, :species

  @@all = []
  @@count = 0

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
    @@count += 1
  end

  def self.all
    @@all
  end

  def self.count
    @@count
  end

  def self.reset_all
    @@all.clear
    @@count = 0
  end

  def say_species
    "I am a #{@species}."
  end

  def cats
    arr = []
    Cat.all.each { |cat| arr << cat if cat.owner == self}
    arr
  end

  def dogs
    arr = []
    Dog.all.each { |dog| arr << dog if dog.owner == self }
    arr 
  end
  
  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.each { |dog| dog.mood = "happy" }
  end

  def feed_cats
    Cat.all.each { |cat| cat.mood = "happy" }
  end

  def sell_pets
    Dog.all.each { |dog| dog.mood = "nervous" }
    Dog.all.each { |dog| dog.owner = nil }
    Cat.all.each { |cat| cat.mood = "nervous" }
    Cat.all.each { |cat| cat.owner = nil }
  end

  def list_pets
    dog_count = 0
    cat_count = 0

    Dog.all.each { |dog| dog_count += 1 if dog.owner == self }
    Cat.all.each { |cat| cat_count += 1 if cat.owner == self }

    return "I have #{dog_count} dog(s), and #{cat_count} cat(s)."
  end

end