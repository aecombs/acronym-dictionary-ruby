require 'thor'

class AcroDictCLI < Thor
  # class_option :offensive, :type => :boolean, :aliases => "-o"

  desc "define ACRONYM", "Generate random definition"
  long_desc <<-LONGDESC
    Got an acronym? We've got a definition!

    These aren't your ordinary definitions, of course.

    These are randomly generate definitions meant to delight and concern one and all.

    So, have at it! Enter some letters and let's see what your acronym could actually stand for!
  LONGDESC
  def define(acronym)
    if !is_valid(acronym)
      puts "Could not define: The best acronyms are 5 characters or less. (e.g. ASCII, NASA, ADA"
      return
    end

    generate_definition(acronym)
  end

  desc "surprise_me", "When you know what you want, but not what you need"
  long_desc <<-LONGDESC
    Sometimes, you just don't know what you need.
    If you're bored or just curious, use this command to generate both an acronym and its corresponding definition.
  LONGDESC
  def surprise_me
    alphabet = ('A'..'Z').to_a
    random_letters = alphabet.sample(rand(1..5))
    
    acronym = ""
    random_letters.each do |l|
      acronym += l
    end
    generate_definition(acronym)
  end

  desc "about", "Find out more about acronyms"
  def about
    puts "Acronym   |ˈakrəˌnim|"
    puts "noun: an abbreviation formed from the initial letters of other words and pronounced as a word (e.g. ASCII, NASA)."
    puts "1940s: from Greek akron ‘end, tip’+ -onym."
  end

  private

  def generate_definition(acronym)
    nouns = {

    }
    adjectives = {

    }
    adverbs = {
      
    }
    words = [
      "Supersonic",
      "Halogenic",
      "Feline",
      "Wild",
      "Hippie",
      "Unicorn",
      "Aliens"
    ]

    definition = words.sample(acronym.length)

    print "#{acronym.upcase} stands for: "

    print_definition(definition)
  end

  def print_definition(definition)
    definition.each do |d|
      print d + " "
    end
    print "\n"
  end

  def is_valid(acronym)
    /[a-zA-Z]/.match?(acronym) && acronym.length <= 5
  end
end

AcroDictCLI.start(ARGV)