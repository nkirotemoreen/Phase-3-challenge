require 'pry'
class Magazine
  attr_accessor :name, :category
  @@all =[]

  def initialize(name, category)
    @name = name
    @category = category

    @@all<<self
  end
  def self.all
    @@all
  end
  def contributors # Returns an array of Author instances who have written for this magazine
    articles_by_authors_in_this_magazine.map {|article| article.author}
  end
  def self.find_by_name(name)
    @@all.find {|magazine| magazine.name == name}
  end
  def article_titles
    articles_by_authors_in_this_magazine.map {|article| article.title}
  end
  def contributing_authors
    all_magazine_authors = articles_by_authors_in_this_magazine.map {|article| article.author}
    uniq_magazine_authors =  all_magazine_authors.uniq
    uniq_magazine_authors.filter {|author|  all_magazine_authors.count(author) > 2}
  end
  private
  def articles_by_authors_in_this_magazine
    Article.all.filter {|article| article.magazine == self}
  end
  end
end
binding.pry