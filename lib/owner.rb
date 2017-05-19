require 'pry'

class Owner
  @@all = []
  @@owner_count = 0

  attr_accessor :pets, :name

  def initialize pets
    @pets = {
      fishes: [],
      cats: [],
      dogs: []
    }
    @species = "human"
    @@all << self
    @@owner_count += 1
  end

  def species
    @species
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(fish_name)
    self.pets[:fishes] << Fish.new(fish_name)
  end

  def buy_cat(cat_name)
    self.pets[:cats] << Cat.new(cat_name)
  end

  def buy_dog(dog_name)
    self.pets[:dogs] << Dog.new(dog_name)
  end

  def walk_dogs
    self.pets[:dogs].each {|dog| dog.mood = "happy"}
  end

  def play_with_cats
    self.pets[:cats].each {|cat| cat.mood = "happy"}
  end

  def feed_fish
    self.pets[:fishes].each {|fish| fish.mood = "happy"}
  end

  def pet_aggregate
    pet_ary = self.pets[:dogs] + self.pets[:cats] + self.pets[:fishes]
  end

  def sell_pets
    pet_ary = pet_aggregate
    pet_ary.each do |pet|
      pet.mood = "nervous"
    end
    self.pets = {
      fishes: [],
      cats: [],
      dogs: []
    }
  end

  def list_pets
    pet_ary = pet_aggregate
    cat_c = pet_ary.count { |cat| cat.class.name == "Cat" }
    dog_c = pet_ary.count { |dog| dog.class.name == "Dog" }
    fish_c = pet_ary.count { |fish| fish.class.name == "Fish" }
    "I have #{fish_c} fish, #{dog_c} dog(s), and #{cat_c} cat(s)."
  end

  def self.all
    @@all
  end

  def self.count
    @@owner_count
  end

  def self.reset_all
    @@owner_count = 0
  end
end
