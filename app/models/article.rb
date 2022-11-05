require 'pry'
class Article
 
    attr_reader :author, :magazine, :title
    @@all=[]
    def initialize(author, magazine, title)
        if(author.is_a?(Author) && magazine.is_a?(Magazine) && title.is_a?(String))
            @author = author
            @magazine = magazine
            @title = title
            @@all << self
        else 
            puts "Expected author and magazine to be objects, title to be a string"
        end    
    end

    def self.all
        @all
    end

    def author
        @author.name
    end

    def magazine
        @magazine.name
    end
end

binding.pry