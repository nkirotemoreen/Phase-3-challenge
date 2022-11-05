require 'pry'
class Author
  attr_reader :name


  def initialize(name)
    @name = name
    @articles = []
    @magazines = []
    if name.is_a?(String)
      @name = name
    else
      puts "Expected name.class to be a String"
    end
  end

  #Returns an array of Article instances the author has written
  def articles
    Article.all.select {|article| article.author==self}
  end
  #Returns a **unique** array of Magazine instances for which the author has contributed to
  def magazines
    magazines = articles.map {|article| article.magazine}
    #make them unique
    magazines.map {|magazine| magazine.name}.uniq
  end
end
binding.pry