class Book
  attr_accessor :title, :author
  attr_reader :pages
  
  def initialize
    @title = "Default Book"
  end
  
  def some_method(arg="r")
    
  end
  some_method("n")
  
  # def title
  #     @title 
  #   end
  #   
  #   def title=(title_var)
  #     @title = title_var
  #   end
  #   
  #   def author
  #     @author
  #   end
  #   
  #   def author=(author_var)
  #     @author = author_var
  #   end
  #   
  #   def pages
  #     @pages
  #   end
  
end # end Book