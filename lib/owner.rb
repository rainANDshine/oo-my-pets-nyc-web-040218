class Owner
  attr_reader :species
  attr_accessor :name
  @@all = []

  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end

  def initialize(name)
    @name = name
  end

  def say_species
    "I am a #{species}."
  end

  def pets
    if @pets == nil
      @pets = {:fishes => [], :dogs => [], :cats => []}
    else
      @pets
    end
  end

  def buy_fish(fish)
    self.pets[:fishes] << Fish.new(fish)
  end

  def buy_cat(cat)
    self.pets[:cats] << Cat.new(cat)
  end

  def buy_dog(dog)
    self.pets[:dogs] << Dog.new(dog)
  end

  def walk_dogs
    self.pets[:dogs].last.mood = "happy"
  end

  def play_with_cats
    self.pets[:cats].last.mood = "happy"
  end

  def feed_fish
    self.pets[:fishes].last.mood = "happy"
  end

  def sell_pets
    self.pets.each do |type, pets|
      pets.each do |pet|
        pet.mood = "nervous"
      end
      pets.clear
    end
  end

  def list_pets
    "I have #{self.pets[:fishes].count} fish, #{self.pets[:dogs]} dog(s), and #{self.pets[:cats]} cat(s)."
  end
end
